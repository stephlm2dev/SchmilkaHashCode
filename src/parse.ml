type datacenter = {
                row: int;
   location_per_row: int;
   occuped_location: int;
   available_groups: int;
  available_servers: int;
}

type occuped_location = {
  index: int;
    r_i: int;
    s_i: int;
}

type available_servers = {
        index: int;
  nb_location: int;
     capacity: int;
}

let main =
  let split = Str.split (Str.regexp_string " ") in
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
      let datacenter = split line in
      {
                      row = int_of_string (List.nth datacenter 0);
        location_per_row  = int_of_string (List.nth datacenter 1);
        occuped_location  = int_of_string (List.nth datacenter 2);
        available_groups  = int_of_string (List.nth datacenter 3);
        available_servers = int_of_string (List.nth datacenter 4);
      }
  and additional_information data nb_occuped = 
    let occuped_locations = ref [] and
        available_servers = ref [] in
    let get_info position el =
      let split_data = split el in
      if position < nb_occuped then
        let occuped_location = {
          index = position;
            r_i = int_of_string (List.nth split_data 0);
            s_i = int_of_string (List.nth split_data 1);
        } in
        occuped_locations :=  occuped_location :: !occuped_locations
      else 
        let available_server = {
                index = position;
          nb_location = int_of_string (List.nth split_data 0);
             capacity = int_of_string (List.nth split_data 1);
        } in
        available_servers :=  available_server :: !available_servers
    in
    let _ = List.iteri get_info data in
    (!occuped_locations, !available_servers)
  in
    let data = read_input_file "dc.in" in
    let datacenter_meta = retrieve_datacenter_information (List.hd data) in
    let (occuped_locations, available_servers) =
      additional_information (List.tl data) datacenter_meta.occuped_location in
    let first_occuped = List.hd occuped_locations and
         first_server = List.hd available_servers in
    Printf.printf "%i %i %i | %i %i %i" 
      first_occuped.index
      first_occuped.r_i
      first_occuped.s_i
      first_server.index
      first_server.capacity
      first_server.nb_location
;;
