# The name of this view in Looker is "Calendar Dates"
view: calendar_dates {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `transmilenio.calendar_dates` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Date" in Explore.

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: exception_type {
    type: number
    sql: ${TABLE}.exception_type ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_exception_type {
    type: sum
    sql: ${exception_type} ;;  }
  measure: average_exception_type {
    type: average
    sql: ${exception_type} ;;  }

  dimension: service_id {
    type: number
    sql: ${TABLE}.service_id ;;
  }
  measure: count {
    type: count
  }
}
