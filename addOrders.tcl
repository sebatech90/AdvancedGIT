   orders::add PRODUCTION_9 \
      -number 1009 \
      -item_tag 30023 \
      -type_tag PRODUCTION \
      -status_tag RELEASED \
      -object_tag RZL-L2 \
      -planned_quantity 10000 \
      -planned_start {2021-05-17 13:00:00 +02:00} \
      -planned_end {2021-05-26 17:00:00 +02:00} \
      -steps {
         10 {
            operation_tag PACKING
            status_tag RELEASED
            plans {{
               object_tag RZL-L2
               status_tag RELEASED
               planned_start {2021-05-17 13:00:00 +02:00}
               planned_end {2021-05-26 17:00:00 +02:00}
               planned_quantity 10000
            }}
            production_settings {
               RZL-L2 {cycle_time_s 0.095000 efficiency 1.000000}
            }
         }
      }

   orders::flow::start -order_tag PRODUCTION_9 -step_number 10 -start_time [clock seconds] -editor_login ant -comment TEST1

    set stepDict [dict create \
                10 [dict create {*}$start_val \
                    object_tag $object_tag \
                    status_tag $status_tag \
                    planned_start $from \
                    planned_end $to \
                    planned_quantity 1.0 \
                    operation_tag DEFAULT_OPERATION \
                    production_settings [ dict create \
                        $object_tag [ dict create \
                            cycle_time_s $duration \
                        ] \
                    ] \
                ] \
            ]

    orders::add $name \
    -number [string tolower $name] \
    -status_tag $status_tag \
    -object_tag $object_tag \
    -type_tag "MAINTENANCE" \
    -item_tag "57304884" \
    -planned_start $from \
    -planned_end $to \
    -steps [dict create \
            10 [dict create {*}$start_val \
                operation_tag DEFAULT_OPERATION \
                object_tag $object_tag \
                status_tag $status_tag \
                planned_start $from \
                planned_end $to \
                maintenance_settings [ dict create \
                    $object_tag [ dict create \
                        duration $duration \
                        employees_count 2 \
                    ]
                ]
            ]
        ] \
    {*}$additional_flags