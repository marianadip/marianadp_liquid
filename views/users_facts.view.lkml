view: users_facts {
    derived_table: {
      sql: SELECT
           order_items.user_id AS user_id
          ,COUNT(distinct order_items.order_id) AS lifetime_order_count
          ,SUM(order_items.sale_price) AS lifetime_revenue
          ,MIN(order_items.created_at) AS first_order_date
          ,MAX(order_items.created_at) AS latest_order_date
          FROM marianadp_liquid.order_items
          WHERE {% condition select_date %} order_items.created_at {% endcondition %}
          GROUP BY user_id;;
    }

    filter: select_date {
      type: date
      suggest_explore: order_items
      suggest_dimension: order_items.returned_date
    }

    measure: count {
      hidden: yes
      type: count
      drill_fields: [detail*]
    }

    dimension: user_id {
      primary_key: yes
      type: number
      sql: ${TABLE}.user_id ;;
    }

    dimension: lifetime_order_count {
      type: number
      sql: ${TABLE}.lifetime_order_count ;;
    }

    dimension: lifetime_revenue {
      type: number
      sql: ${TABLE}.lifetime_revenue ;;
    }

    measure: average_lifetime_revenue {
      type: average
      sql: ${TABLE}.lifetime_revenue ;;
    }
    measure: average_lifetime_order_count {
      type: average
      sql: ${TABLE}.lifetime_order_count ;;
    }

    dimension_group: first_order_date {
      type: time
      sql: ${TABLE}.first_order_date ;;
    }

    dimension_group: latest_order_date {
      type: time
      sql: ${TABLE}.latest_order_date ;;
    }

    set: detail {
      fields: [user_id, lifetime_order_count, lifetime_revenue, first_order_date_time, latest_order_date_time]
    }
   }
