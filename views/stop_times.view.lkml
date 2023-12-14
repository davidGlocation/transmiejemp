# The name of this view in Looker is "Stop Times"
view: stop_times {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `transmilenio.stop_times` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Arrival Time" in Explore.

  dimension: arrival_time {
    type: string
    sql: ${TABLE}.arrival_time ;;
  }

  dimension: departure_time {
    type: string
    sql: ${TABLE}.departure_time ;;
  }

  dimension: stop_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.stop_id ;;
  }

  dimension: stop_sequence {
    type: number
    sql: ${TABLE}.stop_sequence ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_stop_sequence {
    type: sum
    sql: ${stop_sequence} ;;  }
  measure: average_stop_sequence {
    type: average
    sql: ${stop_sequence} ;;  }

  dimension: timepoint {
    type: number
    sql: ${TABLE}.timepoint ;;
  }

  dimension: trip_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.trip_id ;;
  }
  measure: count {
    type: count
    drill_fields: [trips.trip_id, stops.stop_id, stops.stop_name]
  }
}
