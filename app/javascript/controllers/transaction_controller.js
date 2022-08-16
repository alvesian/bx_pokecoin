import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ "pokeName", "pokeValue", "pokeImg" ]

  connect() {
    Rails.ajax({
    url: "https://api.coinstats.app/public/v1/coins?skip=0&limit=5&currency=USD",
    type: 'GET',
    dataType: 'json',
    crossDomain: true,
    success: (response01) => {
      window.btc_usd = response01['coins'][0]['price']
    }
  })
  }

  check() {
    const btc_usd = window.btc_usd
    const element = this.pokeNameTarget
    const poke_name = element.value.toLowerCase()
    const url = ("https://pokeapi.co/api/v2/pokemon/"+ poke_name )
    
    Rails.ajax({
      url: url,
      type: 'GET',
      dataType: 'json',
      crossDomain: true,
      error: () => {
        this.pokeValueTarget.value = "Pokemon não encontrado"
      },
      success: (response) => {
        const value = response['base_experience'] * 0.00000001 * btc_usd
        this.pokeValueTarget.value = value
        this.pokeImgTarget.value = response['sprites']['other']['official-artwork']['front_default']
      }
    })
  }
}