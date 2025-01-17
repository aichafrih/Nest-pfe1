import { IsNotEmpty } from "class-validator";

export class CreateRapportDto {
    @IsNotEmpty()
    date_expertise  
    @IsNotEmpty()
    adresse_expertise
    @IsNotEmpty()
    lieu_expertise 
    @IsNotEmpty()
    expert 
    @IsNotEmpty()
    email_expert 
    @IsNotEmpty()
    tele_expert 
    @IsNotEmpty()
    nom_client 
    @IsNotEmpty()
    adresse_client
    @IsNotEmpty() 
    tel_client
    @IsNotEmpty()
    email_client
    @IsNotEmpty()
    marque_v 
    @IsNotEmpty()
    modele_v 
    @IsNotEmpty()
    motirisation_v
    @IsNotEmpty()
    couleur_v 
    @IsNotEmpty()
    transmission_v
    @IsNotEmpty() 
    km_v 
    @IsNotEmpty()
    his_prio 
    @IsNotEmpty()
    immatriculation_v
    @IsNotEmpty()
    carrosserie
    @IsNotEmpty()
    type_carburent
    @IsNotEmpty()
    puissance
    @IsNotEmpty()
    nb_place
    @IsNotEmpty()
    nb_porte  
    @IsNotEmpty()
    commentaire_exp
}