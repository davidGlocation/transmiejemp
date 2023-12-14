# The name of this view in Looker is "Fare Rules"
view: fare_rules {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `transmilenio.fare_rules` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Contains ID" in Explore.

  dimension: contains_id {
    type: number
    sql: ${TABLE}.contains_id ;;
  }

  dimension: destination_id {
    type: number
    sql: ${TABLE}.destination_id ;;
  }

  dimension: fare_id {
    type: number
    sql: ${TABLE}.fare_id ;;
  }

  dimension: origin_id {
    type: number
    sql: ${TABLE}.origin_id ;;
  }

  dimension: route_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.route_id ;;
  }
  measure: count {
    type: count
    drill_fields: [routes.route_id, routes.route_long_name, routes.route_short_name]
  }
}
