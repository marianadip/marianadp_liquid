  view: location {
    extension: required

    dimension: city {
      type: string
      sql: ${TABLE}.city ;;
      link: {
        label: "Google"
        url: "http://www.google.com/search?q={{ value }}"
        icon_url: "http://google.com/favicon.ico"
      }
    }

    dimension: state {
      type: string
      sql: ${TABLE}.state ;;
      map_layer_name: us_states
      link: {
        label: "Google"
        url: "http://www.google.com/search?q={{ value }}"
        icon_url: "http://google.com/favicon.ico"
      }
    }
    dimension: zip {
      type: zipcode
      sql: ${TABLE}.zip ;;
    }
    dimension: country {
      type: string
      map_layer_name: countries
      sql: ${TABLE}.country ;;
      link: {
        label: "Google"
        url: "http://www.google.com/search?q={{ value }}"
        icon_url: "http://google.com/favicon.ico"
      }
    }

    dimension: latitude {
      type: number
      sql: ${TABLE}.latitude ;;
    }

    dimension: longitude {
      type: number
      sql: ${TABLE}.longitude ;;
    }
  }
