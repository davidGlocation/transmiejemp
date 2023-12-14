# The name of this view in Looker is "Frequencies"
view: frequencies {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `transmilenio.frequencies` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "End Time" in Explore.

  dimension: end_time {
    type: string
    sql: ${TABLE}.end_time ;;
  }

  dimension: headway_secs {
    type: number
    sql: ${TABLE}.headway_secs ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_headway_secs {
    type: sum
    sql: ${headway_secs} ;;  }
  measure: average_headway_secs {
    type: average
    sql: ${headway_secs} ;;  }

  dimension: start_time {
    type: string
    sql: ${TABLE}.start_time ;;
  }

  dimension: trip_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.trip_id ;;
  }
  measure: count {
    type: count
    drill_fields: [trips.trip_id]
  }
}
