# The name of this view in Looker is "Dispositivos Accesos Variacion"
view: dispositivos_accesos_variacion {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `transmilenio.Dispositivos_accesos_variacion` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Device Lat" in Explore.

  dimension: device_lat {
    type: number
    sql: ${TABLE}.device_lat ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_device_lat {
    type: sum
    sql: ${device_lat} ;;  }
  measure: average_device_lat {
    type: average
    sql: ${device_lat} ;;  }

  dimension: device_lat_est {
    type: number
    sql: ${TABLE}.device_lat_est ;;
  }

  dimension: device_lon {
    type: number
    sql: ${TABLE}.device_lon ;;
  }

  dimension: device_lon_est {
    type: number
    sql: ${TABLE}.device_lon_est ;;
  }

  dimension: dia {
    type: string
    sql: ${TABLE}.dia ;;
  }

  dimension: geometria {
    type: string
    sql: ${TABLE}.geometria ;;
  }

  dimension: hora {
    type: number
    sql: ${TABLE}.hora ;;
  }

  dimension: nombre_troncal {
    type: string
    sql: ${TABLE}.nombre_troncal ;;
  }

  dimension: promedio_dispositivos {
    type: number
    sql: ${TABLE}.promedio_dispositivos ;;
  }

  dimension: salida {
    type: string
    sql: ${TABLE}.salida ;;
  }

  dimension: total_dispositivos {
    type: number
    sql: ${TABLE}.total_dispositivos ;;
  }

  dimension: total_huellas {
    type: number
    sql: ${TABLE}.total_huellas ;;
  }

  dimension: variacion {
    type: number
    sql: ${TABLE}.variacion ;;
  }
  measure: count {
    type: count
  }
}
