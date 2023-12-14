# The name of this view in Looker is "Agency"
view: agency {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `transmilenio.agency` ;;
  drill_fields: [agency_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: agency_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.agency_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Agency Lang" in Explore.

  dimension: agency_lang {
    type: string
    sql: ${TABLE}.agency_lang ;;
  }

  dimension: agency_name {
    type: string
    sql: ${TABLE}.agency_name ;;
  }

  dimension: agency_phone {
    type: string
    sql: ${TABLE}.agency_phone ;;
  }

  dimension: agency_timezone {
    type: string
    sql: ${TABLE}.agency_timezone ;;
  }

  dimension: agency_url {
    type: string
    sql: ${TABLE}.agency_url ;;
  }
  measure: count {
    type: count
    drill_fields: [agency_id, agency_name, fare_attributes.count, routes.count]
  }
}
