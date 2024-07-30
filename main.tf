

resource "newrelic_one_dashboard" "exampledash" {
  name        = "APM-New Relic Terraform-tvariable"
  permissions = "public_read_only"
  page {
    name = "APM-New Relic Terraform-tvariable"
    
  widget_billboard {
    title  = "TraceId"
    row    = 1
    column = 1
    width  = 6
    height = 3

    nrql_query {
     query = "FROM Transaction SELECT average(duration) WHERE traceId IN ({{traceid}}) WHERE appName='apm-vs-relicstaurants'"
    #  SELECT *  FROM Transaction WHERE traceId='10640a149757f6da2e69ba596abddb36'WHERE appName='apm-vs-relicstaurants'
    }
  }
  
    widget_billboard {
      title  = "Guid-average duration"
      row    = 1
      column = 7
      width  = 6
      height = 3

      nrql_query { 
        query = "FROM Transaction SELECT average(duration) WHERE guid IN ({{guid}}) WHERE appName = 'apm-vs-relicstaurants'"
        # SELECT average(duration) FROM Transaction WHERE guid ='0fc2b2976d206c89'AND appName = 'apm-vs-relicstaurants'
      }
    }

     widget_billboard {
      title  ="statuscode"
      row    = 4
      column = 1
      width  = 6
      height = 3

      nrql_query {
        account_id = 4438263
        query      = "FROM Transaction SELECT count(*) WHERE http.statusCode = '201' IN ({{statuscode}}) AND appName = 'apm-vs-relicstaurants'"
    #   SELECT count(*) FROM Transaction WHERE http.statusCode = '201' AND  appName='apm-vs-relicstaurants' SINCE 1 hour ago
      }
    
    }
  

#  widget_billboard {
#       title  ="Process Id-memory"
#       row    = 4
#       column = 7
#       width  = 6
#       height = 3

#       nrql_query {
#         account_id = 4438263
#         query      = "FROM SystemSample SELECT count(memoryVirtualSizeBytes) WHERE processId IN ({{processid}})"
#       }
    
#     }
    }
variable {
      default_values     = ["10640a149757f6da2e69ba596abddb36:"]
      is_multi_selection = true
    #   item {
    #     title= "device"
    #     value = "D:"
    #   }

      name = "traceid"
      nrql_query {
        account_ids = [4438263]
        # query       = "FROM Transaction SELECT average(duration) FACET appName"
        query= "FROM Transaction SELECT uniques(traceId)"

      }
      replacement_strategy = "string"
      title                = "traceid"
      type                 = "nrql"
  }


variable {
      default_values     = ["0fc2b2976d206c89:"]
      is_multi_selection = true
    #   item {
    #     title= "device"
    #     value = "D:"
    #   }

      name = "guid"
      nrql_query {
        account_ids = [4438263]
        # query       = "FROM Transaction SELECT average(duration) FACET appName"
        query= "FROM Transaction SELECT uniques(guid)"

      }
      replacement_strategy = "string"
      title                = "guid"
      type                 = "nrql"
  }

variable {
      default_values     = ["200:"]
      is_multi_selection = true
    #   item {
    #     title= "device"
    #     value = "D:"
    #   }

      name = "statuscode"
      nrql_query {
        account_ids = [4438263]
        query= "FROM Transaction SELECT uniques(http.statusCode)"
        
        

      }
      replacement_strategy = "string"
      title                = "statuscode"
      type                 = "nrql"
  }


# variable {
#       default_values     = [10028]
#       is_multi_selection = true
#     #   item {
#     #     title= "Memory"
#     #     value = 10800
#     #   }

#       name = "processid"
#       nrql_query {
#         account_ids = [4438263]
#         # query       = "FROM Transaction SELECT average(duration) FACET appName"
#         query= "FROM ProcessSample SELECT uniques(processId)"
        

#       }
#       replacement_strategy = "number"
#       title                = "processid"
#       type                 = "nrql"
#   }




 }

