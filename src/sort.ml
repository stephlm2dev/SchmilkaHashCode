

(* 	nb_rang = Nombre de rangées,
	nb_pos = Nombre d'emplacement par rangées,
	l_non = Liste des emplacements non dispos,
	nb_groupes = Nombre de groupes,
	l_serv = Listes des serveurs
 *)
type line = {
	rang : int;
    non_dispo : int list;
    taille_zone : int list;
    serveurs : (int * int * int) list; (*x, y, grp*)
}

(* let generate_lines l_not nb_rang nb_pos =
	let l_not = List.sort (fun (_, r, _) -> r ) l_not in
	let gen_lines l_not nb_rang =
		let v_rang = nb_rang
		and v_non_dispo = List.filter (fun (r, _) -> if (r = rang) then true else false) l_not in
		let v_non_dispo = List.sort (fun (_, p) -> p) non_dispo in
		let f_taille_zone non_dispo =
			match non_dispo with
			| [] -> nb_pos
			| i :: [] ->
				let diff = nb_pos - i - 1 in
				if (diff = 0) then [] else [diff]
			| i1 :: i2 :: l ->
				let diff = i2 - i1 - 1 in
					[diff] @ taille_zone (i2 :: l)
		in
		{
		rang = v_rang;
		non_dispo = v_non_dispo;
		taille_zone = f_taille_zone non_dispo;
		serveurs = [];
		} :: (gen_lines l_not (nb_rang - 1)) in
	gen_lines l_not nb_rang *)
		


let affect nb_rang nb_pos nb_gr l_not l_serv =
	(*Nous enlevons les serveurs qui sont plus gros que s + 1 - p *)
	let max_size = nb_pos + 1 - nb_gr in
	let l_serv = List.filter (fun (id, size, cap) -> if ((cap / size) > max_size)
								then true else false) l_serv in
	(* On trie sur le ratio cap / size *)
	let l_serv = List.sort (fun (id, size, cap) -> (cap / size)) l_serv in
	(* On va affecter la liste de 1 ... n / n ... 1 / 1 .. n / n .. 1 etc ...*)
	let l_serv = List.mapi (fun i (size, cap, id) ->
								let grp = if ((i % nb_grp) % 2 = 0)
												then i % nb_grp
												else nb_grp - (i % nb_grp)
								in (size, cap, grp)) l_serv in

	(* let lines = generate_lines l_not nb_rang in *)

	(* let algo server lines =
		let l =
			if 
		List.map (fun l -> ) lines *)
	failwith "lolilol"