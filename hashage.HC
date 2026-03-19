extern "c" I32 scanf(U8 *fmt, ...); //implémentation de scanf en c pour lire une chaîne de caractères car la version holyc linux ne supporte pas les entrées standard

U64 HashStr(U8 *s) //fonction de hashage qui prend jusqu à 255 caractères et retourne un hash de type U64
{
    U64 hash = 0; //initialisation du hash à 0

    while (*s) //tant que le caractère pointé par s n'est pas nul, on continue à calculer le hash
    {
        hash = hash * 31 + *s; //calcul du hash en multipliant le hash actuel par 31 et en ajoutant la valeur du caractère pointé par s
        s++; //incrémentation du pointeur s pour passer au caractère suivant
    }

    return hash;
}

U0 Main() //fonction principale du programme elle ne return rien (U0) et est de type void
{
    U8 texte[256]; //déclaration d'un tableau de caractères de taille 256 pour stocker le texte à hash, on utilise 256 pour pouvoir stocker jusqu'à 255 caractères plus le caractère nul de fin de chaîne
    U64 h; //déclaration d'une variable de type U64 pour stocker le résultat du hash

    "texte à hash : "; //affichage d'un message pour demander à l'utilisateur de saisir le texte à hash
    scanf("%255s", texte); //lecture de la chaine de caractères saisie par l'utilisateur, on utilise %255s pour éviter les buffer overflow en limitant la lecture à 255 caractères et laisser de la place pour le caractère nul de fin de chaîne

    h = HashStr(texte); //appel de la fonction de hashage en passant le texte saisi par l'utilisateur et stockage du résultat dans la variable h

    "Hash : %X\n", h; //affichage du résultat du hash en utilisant le format %X pour afficher le hash en hexadécimal, on peut aussi utiliser %llu pour le décimal mais la je souhaite imiter le comportement d'un hashage classique comme je le fait dans ma blockchain en python
}

Main; //appel de la fonction principale pour exécuter le programme


//*En developpement, programme non fini*