# The name of this view in Looker is "Fare Attributes"
view: fare_attributes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `transmilenio.fare_attributes` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Agency ID" in Explore.

  dimension: agency_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.agency_id ;;
  }

  dimension: currency_type {
    type: string
    sql: ${TABLE}.currency_type ;;
  }

  dimension: fare_id {
    type: number
    sql: ${TABLE}.fare_id ;;
  }

  dimension: payment_method {
    type: number
    sql: ${TABLE}.payment_method ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_price {
    type: sum
    sql: ${price} ;;  }
  measure: average_price {
    type: average
    sql: ${price} ;;  }

  dimension: transfer_duration {
    type: number
    sql: ${TABLE}.transfer_duration ;;
  }

  dimension: transfers {
    type: number
    sql: ${TABLE}.transfers ;;
  }
  measure: count {
    type: count
    drill_fields: [agency.agency_name, agency.agency_id]
  }
}
