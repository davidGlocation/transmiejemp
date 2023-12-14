# The name of this view in Looker is "Routes"
view: routes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `transmilenio.routes` ;;
  drill_fields: [route_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: route_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.route_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Agency ID" in Explore.

  dimension: agency_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.agency_id ;;
  }

  dimension: route_color {
    type: string
    sql: ${TABLE}.route_color ;;
  }

  dimension: route_desc {
    type: string
    sql: ${TABLE}.route_desc ;;
  }

  dimension: route_long_name {
    type: string
    sql: ${TABLE}.route_long_name ;;
  }

  dimension: route_short_name {
    type: string
    sql: ${TABLE}.route_short_name ;;
  }

  dimension: route_text_color {
    type: string
    sql: ${TABLE}.route_text_color ;;
  }

  dimension: route_type {
    type: number
    sql: ${TABLE}.route_type ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_route_type {
    type: sum
    sql: ${route_type} ;;  }
  measure: average_route_type {
    type: average
    sql: ${route_type} ;;  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	route_id,
	route_long_name,
	route_short_name,
	agency.agency_name,
	agency.agency_id,
	fare_rules.count,
	trips.count
	]
  }

}
