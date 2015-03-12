type datacenter = {
    row: int;
    location_per_row: int;
    occuped_location: int;
    available_groups: int;
    available_servers: int;
}

let main =
  let read_input_file file = 
    let lines = ref [] in
    let file_id = open_in file in
    try
      while true; do 
        lines := input_line file_id :: !lines
      done; []
    with End_of_file ->
      close_in file_id;
      List.rev !lines
  and retrieve_datacenter_information line = 
    let split = Str.split (Str.regexp_string " ") in
    let datacenter = split line in
    {
                    row = int_of_string (List.nth datacenter 0);
      location_per_row  = int_of_string (List.nth datacenter 1);
      occuped_location  = int_of_string (List.nth datacenter 2);
      available_groups  = int_of_string (List.nth datacenter 3);
      available_servers = int_of_string (List.nth datacenter 4);
    }
  in
    let data = read_input_file "dc.in" in
    let datacenter_meta = retrieve_datacenter_information (List.hd data) in
    Printf.printf "%i"  datacenter_meta.row

;;
