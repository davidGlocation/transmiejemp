# The name of this view in Looker is "Trips"
view: trips {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `transmilenio.trips` ;;
  drill_fields: [trip_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: trip_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.trip_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Route ID" in Explore.

  dimension: route_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.route_id ;;
  }

  dimension: service_id {
    type: string
    sql: ${TABLE}.service_id ;;
  }

  dimension: shape_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.shape_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	trip_id,
	routes.route_id,
	routes.route_long_name,
	routes.route_short_name,
	shapes.shape_id,
	frequencies.count,
	stop_times.count
	]
  }

}
