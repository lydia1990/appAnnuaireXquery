(:lydia chabbi:)
(:fichier à placer dans le répertoire webapp:)
(:C'est une bibliothèque de fonction appelée par l'application:)
(:Par exemple en définissant une fois pour toute une fonction xls:template($contenu), on a créé un consturcteur de pages :)
module namespace  xls = "http://www.page.fr" ;

declare variable $xls:testlog := (db:open('Tilde_utilisateurs')//sessionid=session:id());

declare variable $xls:testadmin :=(db:open('Tilde_utilisateurs')/bdd/entry[./sessionid=session:id()]/level = 'admin');
declare variable $xls:crypto := 'lydia';
declare variable $xls:message := db:open("Tilde_utilisateurs")/bdd;
declare variable $xls:session := session:id();

declare function xls:template($contenu) {
   <html>
    <head> 
     <link type="text/css" rel="stylesheet" href="/static/annuaire.css"/>
    </head>
    <body>
    
     <div id="header">Annuaire <p><img width="200" size="100" src="https://www.univ-paris13.fr/wp-content/uploads/uspn.png"/></p> </div>
  <marquee width="900" bgcolor="#FA8072">Welcome To My Application</marquee>
       
     <div id="menuLeft">
       <p><a class="bouton" href="/annuaireConsult">Consulter</a></p>
       <p><a class="bouton"  href="{if ($xls:testlog) then '/logout' else '/login'}">
        { if ($xls:testlog) then 'Logout' else 'Login'}
       </a></p>
       {if ($xls:testadmin) then <p><a class="bouton" href="/adminUsers">Administrer</a></p> else ()}
       <div id="google">
         <form action="google" method="post">
         <input type="text" name="req" placeholder="tapez la requête..."/>
         </form>
     </div>
     </div>
     <div id="contenu">
       {
        if ($xls:testlog)
        then
         $contenu
        else "Vous n'êtes pas connecté."
       }
     </div>
    </body>
   </html>
};

declare function xls:templateLogin($contenu) {
   <html>
    <head> 
     <link type="text/css" rel="stylesheet" href="/static/annuaire.css"/>
    </head>
    <body>
     <div id="header">Annuaire</div>
     <div id="menuLeft">
       <p><a class="bouton" href="/annuaireConsult">Consulter</a></p>
       <p><a class="bouton"  href="{if ($xls:testlog) then '/logout' else '/login'}">
        { if ($xls:testlog) then 'Logout' else 'Login'}
       </a></p>
       <div id="google">
         <form action="google" method="post">
         <input type="text" name="req" placeholder="tapez la requête..."/>
         </form>
     </div>
     </div>
     <div id="contenu">
       {
         $contenu
       }
     </div>
    </body>
   </html>
};
