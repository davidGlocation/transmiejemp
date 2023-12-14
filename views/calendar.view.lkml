# The name of this view in Looker is "Calendar"
view: calendar {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `transmilenio.calendar` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "End Date" in Explore.

  dimension: end_date {
    type: string
    sql: ${TABLE}.end_date ;;
  }

  dimension: friday {
    type: number
    sql: ${TABLE}.friday ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_friday {
    type: sum
    sql: ${friday} ;;  }
  measure: average_friday {
    type: average
    sql: ${friday} ;;  }

  dimension: monday {
    type: number
    sql: ${TABLE}.monday ;;
  }

  dimension: saturday {
    type: number
    sql: ${TABLE}.saturday ;;
  }

  dimension: service_id {
    type: number
    sql: ${TABLE}.service_id ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.start_date ;;
  }

  dimension: sunday {
    type: number
    sql: ${TABLE}.sunday ;;
  }

  dimension: thursday {
    type: number
    sql: ${TABLE}.thursday ;;
  }

  dimension: tuesday {
    type: number
    sql: ${TABLE}.tuesday ;;
  }

  dimension: wednesday {
    type: number
    sql: ${TABLE}.wednesday ;;
  }
  measure: count {
    type: count
  }
}
