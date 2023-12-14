# The name of this view in Looker is "Stops"
view: stops {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `transmilenio.stops` ;;
  drill_fields: [stop_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: stop_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.stop_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Location Type" in Explore.

  dimension: location_type {
    type: string
    sql: ${TABLE}.location_type ;;
  }

  dimension: parent_station {
    type: string
    sql: ${TABLE}.parent_station ;;
  }

  dimension: stop_code {
    type: string
    sql: ${TABLE}.stop_code ;;
  }

  dimension: stop_lat {
    type: number
    sql: ${TABLE}.stop_lat ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_stop_lat {
    type: sum
    sql: ${stop_lat} ;;  }
  measure: average_stop_lat {
    type: average
    sql: ${stop_lat} ;;  }

  dimension: stop_lon {
    type: number
    sql: ${TABLE}.stop_lon ;;
  }

  dimension: stop_name {
    type: string
    sql: ${TABLE}.stop_name ;;
  }

  dimension: zone_id {
    type: number
    sql: ${TABLE}.zone_id ;;
  }
  measure: count {
    type: count
    drill_fields: [stop_id, stop_name, stop_times.count]
  }
}
