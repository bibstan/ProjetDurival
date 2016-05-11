
                        var mymap = L.map('mapid').setView([48.692054, 6.184417], 15);
                        //http://mapwarper.net/maps/tile/13564/{z}/{x}/{y}.png
                        //https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw
                        L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw', {
                        maxZoom: 20, attribution: 'Map data ©; OpenStreetMap contributors, ' +
                        'CC-BY-SA, ' +
                        'Imagery © Mapbox',
                        id: 'mapbox.streets'
                        }).addTo(mymap);
                        
                        
                        L.polygon(
                        [
                        [
                        
                        48.700336511159286,6.178371906280517
                        ],
                        [
                        
                        48.70103044460664,6.180174350738525
                        ],
                        [
                        
                        48.700039108181784,6.180174350738525
                        ],
                        [
                        
                        48.699288511900996,6.1806464195251465
                        ],
                        [
                        
                        48.69991164922492,6.183071136474609
                        ],
                        [
                        
                        48.70039315914625,6.184787750244141
                        ],
                        [
                        
                        48.70076136950753,6.186268329620361
                        ],
                        [
                        
                        48.69792891278156,6.1882853507995605
                        ],
                        [
                        
                        48.69672507040967,6.189079284667968
                        ],
                        [
                        
                        48.69557785265497,6.190195083618164
                        ],
                        [
                        
                        48.69420398958636,6.189594268798828
                        ],
                        [
                        
                        48.692688447661205,6.189508438110352
                        ],
                        [
                        
                        48.69195190614077,6.188392639160156
                        ],
                        [
                        
                        48.68974221693151,6.189208030700684
                        ],
                        [
                        
                        48.68785823865308,6.18903636932373
                        ],
                        [
                        
                        48.686300007873044,6.188371181488037
                        ],
                        [
                        
                        48.68560587136641,6.186847686767578
                        ],
                        [
                        
                        48.68529421512887,6.184358596801758
                        ],
                        [
                        
                        48.68552087440201,6.182384490966797
                        ],
                        [
                        
                        48.686030854036765,6.180968284606934
                        ],
                        [
                        
                        48.688665666546264,6.178951263427734
                        ],
                        [
                        
                        48.68896313671706,6.176869869232177
                        ],
                        [
                        
                        48.6903088131528, 6.17556095123291
                        ],
                        [
                        
                        48.691116201752365,6.174981594085693
                        ],
                        [
                        
                        48.69176776907712, 6.17556095123291
                        ],
                        [
                        
                        48.69274510425496,6.176290512084961
                        ],
                        [
                        
                        48.69356661769983, 6.176462173461914
                        ],
                        [
                        
                        48.69404818831477, 6.177771091461182
                        ],
                        [
                        
                        48.69503964272374,6.17506742477417
                        ],
                        [
                        
                        48.69655511387344, 6.17605447769165
                        ],
                        [
                        
                        48.69724909945107,6.174252033233643
                        ],
                        [
                        
                        48.69832546631806, 6.175603866577148
                        ],
                        [
                        
                        48.69883531627474, 6.176483631134033
                        ],
                        [
                        
                        48.69960008152723, 6.176333427429199
                        ],
                        [
                        
                        48.70047813100715, 6.176204681396484
                        ],
                        [
                        
                        48.700336511159286,6.178371906280517
                        ]
                        ],{color:'black', opacity:0.5}
                        ).bindPopup('Limites approximatives de la ville en 1766').addTo(mymap);
                        
                        var popup = L.popup();
                        L.marker([48.69807,6.18542]).bindPopup("<a href='list.html#nancyPepiniere'>La Pépinière de Nancy</a><br />Le terrain est attribué à l'établissement de la Pépinière royale par arrêt du conseil des finance du 26 octobre 1765.").addTo(mymap); L.marker([48.6765536,6.1994878]).bindPopup("<a href='list.html#bonsecours'>Nancy Bonsecours</a><br />Construite en 1738 sur l'emplacement de la chapelle Notre-Dame-de-la-Victoire (1484).").addTo(mymap); L.marker([48.69476876515408,6.189132928848267]).bindPopup("<a href='list.html#nancyJardin'>Jardin Botanique de Nancy</a><br />Créé en 1751-52. Jardin Dominique-Alexandre Godron").addTo(mymap); L.marker([48.696289,6.18809063321451]).bindPopup("<a href='list.html#nancyCasernes'>Les Casernes de Nancy</a><br />Construites à partir de 1764 près de la porte Sainte-Catherine. Avant cette date l'allusion aux casernes fait référence en particulier aux casernes qui étaient alors sur le site de l'actuel Rectorat.").addTo(mymap); L.marker([48.69299,6.17653]).bindPopup("<a href='list.html#nancyVenerie'>La vénerie de Nancy</a><br />Une des glacières de la Ville était à proximité en 1731.").addTo(mymap); L.marker([48.70013,6.17806]).bindPopup("<a href='list.html#nancyCitadelle'>La citadelle de Nancy</a><br />La construction de la citadelle remonte à 1634 alors que la France occupait Nancy.").addTo(mymap); L.marker([48.69142,6.18595]).bindPopup("<a href='list.html#nancyPrimatiale'>La primatiale</a><br />La construction débute en 1607, interrompue puis reprise en 1703, mais c'est à Stanislas qu'on doit l'achèvemment de ce chantier en 1742. Devient Cathédrale-Primatiale en 1777.").addTo(mymap); L.marker([48.69309,6.18358]).bindPopup("<a href='list.html#nancyHDV'>Hôtel de ville de Nancy</a><br />La construction du nouvel Hôtel de Ville débute en 1752 et s'achève en 1755. L'ancien était près de Saint-Sébastien, entre la rue des Ponts et des Quatres Églises, il fut démoli en 1752.").addTo(mymap); L.marker([48.693644,6.183240]).bindPopup("<a href='list.html#nancyPlaceRoyale'>La place royale de Nancy</a><br />En 1752, le programme des travaux destinés à créer une grande place qui réunirait les deux villes est entériné. La place est achevée avec l'érection de la statue de Louis XV le 18 novembre 1755.").addTo(mymap); L.marker([48.68910,6.18200]).bindPopup("<a href='list.html#nancyMarche'>la place du marché de la ville neuve</a><br />Centre de la ville neuve voulue par Charles III, l'ancien Hôtel de ville y était érigé.").addTo(mymap); L.marker([48.6916688,6.1792884]).bindPopup("<a href='list.html#nancyMinimes'>Les minimes de Nancy</a><br />Fondé en 1592, reconstruit en 1613, il sera détruit à la Révolution.").addTo(mymap); L.marker([48.69082,6.18222]).bindPopup("<a href='list.html#nancyStRoch'>Église Saint Roch de Nancy</a><br />Église construite en 1616").addTo(mymap); L.marker([48.69228,6.18666]).bindPopup("<a href='list.html#nancyCongregation'>La Congrégation</a><br />Fondé en 1615.").addTo(mymap); L.marker([48.69305,6.17843]).bindPopup("<a href='list.html#nancyArdoisiere'>l'ardoisière de Nancy</a><br />Le 9 septembre 1764 les officiers municipaux obtiennent l'autorisation d'exploiter à nouveau une ardoisière dans les fossés près de la Vénerie, on suppose que c'est à ce site que Durival fait allusion.").addTo(mymap); L.marker([48.69244,6.18550]).bindPopup("<a href='list.html#nancyRueCongregation'>Rue de la congrégation de Nancy</a><br />Rue percée en 1752.").addTo(mymap); L.marker([48.69245296801029,6.183156967163086]).bindPopup("<a href='list.html#nancyRueJacobins'>Rue des jacobins de Nancy</a><br />Depuis 1794, rue des Dominicains.").addTo(mymap); L.marker([48.69561,6.1801]).bindPopup("<a href='list.html#nancyStEpvre'>Église Saint Epvre</a><br />L'ancienne église est rasée et remplacée par l'église actuelle (par Prosper Morey à la fin du XIXe siècle).").addTo(mymap); L.marker([48.69609,6.17934]).bindPopup("<a href='list.html#nancyPlaceStEpvre'>Place Saint Epvre</a>").addTo(mymap); L.marker([48.68732,6.18251]).bindPopup("<a href='list.html#nancyStLeopold'>Saint Léopold</a><br />Église du prieuré des Bénedictins, fondée en 1617, prend le titre d'abbaye en 1718.").addTo(mymap); L.marker([48.68904,6.18098]).bindPopup("<a href='list.html#nancyStSebastien'>Église Saint Sébastien</a><br />L'église actuelle date de 1720, sa construction s'achève en 1732..").addTo(mymap); L.marker([48.68736,6.18522]).bindPopup("<a href='list.html#nancyDamesStSacrement'>Les dames du saint Sacrement</a><br />Fondation en 1624 (Notre-Dame de la Consolation)").addTo(mymap); L.marker([48.6908736324152,6.182100176811218]).bindPopup("<a href='list.html#nancyCollegeJesuites'>Collège des jésuites de Nancy</a><br />Fondé en 1615. Accolé à l'église Saint-Roch, entre la rue des Carmes ou était son entrée, et la rue Saint-Dizier").addTo(mymap); L.marker([48.68641,6.18659]).bindPopup("<a href='list.html#nancyNoviciatJesuites'>Église du Noviciat de Nancy</a><br />Fondé en 1601. Église de 1604.").addTo(mymap); L.marker([48.683084,6.191872]).bindPopup("<a href='list.html#nancyStPierre'>Église Saint Pierre de Nancy</a><br />Église consacrée en 1737.").addTo(mymap); L.marker([48.69318,6.18394]).bindPopup("<a href='list.html#nancyBibliotheque'>Bibliothèque publique</a><br />La bibliothèque royale est au premier étage de l'hôtel de Ville depuis 1763, auparavant elle était dans la galerie des Cerfs au Palais Ducal. Elle intègrera à son emplacement actuel vers 1797.").addTo(mymap); L.marker([48.69066,6.17682]).bindPopup("<a href='list.html#nancyPetiteCarmelites'>Les petites Carmélites</a><br />Installé rue Sain-Joseph (rue Chanzy) en 1655.").addTo(mymap); L.marker([48.689356,6.178793]).bindPopup("<a href='list.html#nancyHopitalStCharles'>Hôpital St Charles de Nancy</a><br />Fondée en 1626 dans l'ancienne batterie de cuivre.").addTo(mymap); L.marker([48.6921578,6.1848052992915]).bindPopup("<a href='list.html#nancyHopitalStJulien'>Hôpital saint Julien de Nancy</a><br />La fondation pour les orphelins de Stanislas y est installée en 1748. Hôpital installé en Ville Neuve en 1589. Auparavant Grande-Rue depuis le XIVe siècle.").addTo(mymap); L.marker([48.69146,6.18368]).bindPopup("<a href='list.html#nancyDominiquains'>Les dominicains de Nancy</a><br />Fondé en 1640, détruit à la Révolution.").addTo(mymap); L.marker([48.69160133692096,6.179393827915192]).bindPopup("<a href='list.html#nancyVisitation'>La Visitation</a><br />Le couvent est fondé en 1632, la chapelle subsiste, le lycée Poincaré est construit sur son emprise et celle des Minimes.").addTo(mymap); L.marker([48.69609,6.17806]).bindPopup("<a href='list.html#nancyPenitentsBlancs'>Église des pénitents blancs de Nancy</a>").addTo(mymap); L.marker([48.6902742,6.1875429]).bindPopup("<a href='list.html#nancyTiercelins'>Les tiercelins de Nancy</a><br />Fondé en 1622. Installé en ville-neuve depuis 1656.").addTo(mymap); L.marker([48.692132501452924,6.180826127529144]).bindPopup("<a href='list.html#nancyCarmes'>Les carmes de Nancy</a><br />Installé en 1611-1612.").addTo(mymap); L.marker([48.69577,6.18180]).bindPopup("<a href='list.html#nancyCarriere'>Carrière de Nancy</a>").addTo(mymap); L.marker([48.68694,6.18658]).bindPopup("<a href='list.html#nancyCapucins'>Les capucins de Nancy</a><br />Fondé en 1592. Église construite en 1604.").addTo(mymap); L.marker([48.68694,6.18658]).bindPopup("<a href='list.html#nancyStNicolas'>Paroisse saint Nicolas</a>").addTo(mymap); L.marker([48.68922,6.18062]).bindPopup("<a href='list.html#nancyAugustins'>Les Augustins de Nancy</a><br />Fondé en 1634.").addTo(mymap); L.marker([48.69786,6.17942]).bindPopup("<a href='list.html#nancyCordeliers'>Les Cordeliers de Nancy</a><br />Fondé sous René II en 1487. La chapelle est terminée en 1608.").addTo(mymap); L.marker([48.68900,6.17564]).bindPopup("<a href='list.html#nancyCimetierePorteStJean'>Cimetière extérieur de la porte Saint Jean</a><br />Emplacement approximatif. Ouvert en 1763.").addTo(mymap); L.marker([48.68564,6.18638]).bindPopup("<a href='list.html#nancySteElisabeth'>Les religieuses sainte Elisabeth</a><br />Situation approximative. Sur l'emplacement de l'ancien Hôpital Notre-Dame, Porte Saint-Nicolas.").addTo(mymap); L.marker([48.69441,6.18268]).bindPopup("<a href='list.html#nancyPorteRoyale'>Porte royale de Nancy</a><br />Louis XIV fait construire la porte royale en 1673. Aujourd'hui Porte Héré").addTo(mymap); L.marker([48.6952,6.1798]).bindPopup("<a href='list.html#nancyPlaceDames'>Place des dames de Nancy</a><br />Une des plus anciennes places de Nancy, aujourd'hui Place du Colonel Fabien.").addTo(mymap); L.marker([48.69499,6.18286]).bindPopup("<a href='list.html#nancyPalais'>Palais de Nancy</a><br />Palais, ancien Hôtel de Craon construit en 1716 par Boffrand, architecte du duc Léopold").addTo(mymap); L.marker([48.69358,6.18417]).bindPopup("<a href='list.html#hotelIntendance'>Hôtel de l'intendance sur la carrière à Nancy</a><br />Sur la place Royale").addTo(mymap); L.marker([48.69700,6.18095]).bindPopup("<a href='list.html#hotelGouvernement'>Hôtel du gouvernement</a>").addTo(mymap); L.marker([48.6918394,6.1793484]).bindPopup("<a href='list.html#nancyRueEsplannade'>Rue de l'esplanade à Nancy</a><br />Rebaptisée rue Stanislas depuis l'inauguration de la statue du roi en 1831").addTo(mymap); L.marker([48.68641,6.18659]).bindPopup("<a href='list.html#nancySoeursGrises'>Nouvelle église des Sœurs grises</a>").addTo(mymap); L.marker([48.69685,6.17856]).bindPopup("<a href='list.html#nancyNotreDame'>Eglise et paroisse Notre Dame</a>").addTo(mymap); L.marker([48.69342745,6.18206770823004]).bindPopup("<a href='list.html#nancyComedie'>La comédie</a><br />Nouvelle salle inaugurée en 1755. Auparavant une salle était située depuis 1750 derrière la Palais Ducal.").addTo(mymap); L.marker([48.691874002080645,6.179444789886475]).bindPopup("<a href='list.html#nancyRuePoissonnerie'>Rue de la poissonnerie</a><br />Actuelle rue Gambetta (depuis 1883), Le marché au Poissons était à l'angle de la rue Gambetta et Saint-Dizier, le bâtiment abritera la Comédie jusqu'en 1738 puis une Renfermerie en 1754.").addTo(mymap); L.marker([48.68053,6.17210]).bindPopup("<a href='list.html#garenne'>La Garenne</a><br />Emplacement approximatif du bois de la Garenne. Concession faite en 1731 pour forme une promenade publique.").addTo(mymap); L.marker([48.68567138976192,6.186193227767944]).bindPopup("<a href='list.html#nancyPorteStNic'>Porte Saint Nicolas de Nancy</a>").addTo(mymap); L.marker([48.692364441540896,6.1884355545043945]).bindPopup("<a href='list.html#nancyPorteStGeorges'>Porte Saint Georges de Nancy</a>").addTo(mymap); L.marker([48.6955753,6.18996424213749]).bindPopup("<a href='list.html#nancyPorteSteCatherine'>Porte Sainte Catherine</a>").addTo(mymap); L.marker([48.691131,6.17550720356153]).bindPopup("<a href='list.html#nancyPorteStStanislas'>Porte Saint Stanislas</a>").addTo(mymap); L.marker([48.69272,6.18807]).bindPopup("<a href='list.html#nancySecherie'>la sécherie des lavoirs publics</a>").addTo(mymap); L.marker([48.69017,6.18791]).bindPopup("<a href='list.html#nancyOpheline'>Orphelines</a><br />Fondé en 1715").addTo(mymap); L.marker([48.69051,6.18764]).bindPopup("<a href='list.html#hotelPrimatiale'>l'hotel du grand Doyen de la Primatiale</a><br />Construit entre 1608 et 1619.").addTo(mymap); L.marker([48.694883844038216,6.183207929134369]).bindPopup("<a href='list.html#conciergerie'>la conciergerie</a><br />Prison dans le bâtiment du Palais.").addTo(mymap); L.marker([48.69671,6.17772]).bindPopup("<a href='list.html#arsenal'>l’arsenal</a><br />La construction de l'arsenal remonte à 1550").addTo(mymap);  
                        
                        var imageUrl = '../images/plansNancy/nancy_2.jpg',
                        imageBounds = [[
                        48.698976940346256,6.197233200073242],[
                        
                        48.67179198222903,6.230599880218506]];
                        
                        L.imageOverlay(imageUrl, imageBounds).addTo(mymap);
                        
                        
                        // function onMapClick(e) {
                        //    popup
                        //       .setLatLng(e.latlng)
                        //       .setContent("You clicked the map at " + e.latlng.toString())
                        //       .openOn(mymap);
                        // }
                        
                        
                        // mymap.on('click', onMapClick);
                    