# intAlkBeadando

Hogyan használd a gitet:  
Navigálj a projekted mappájába command line-ban. Először másold ki az elérési útját majd másold be így. Pl.: cd C:\Users\kloczl\Desktop\intAlkBeadando  
basic git parancsok:  
git clone https://github.com/AdamK18/intAlkBeadando.git -> Leklónozza neked ezt a github repositoryt oda, ahova a command line-od mutat
git status -> megmutatja melyik branchen vagy, melyik fájlokat módosítottad.  
git add --all -> Trackeli a módosításaidat. Minden commit előtt használd.  
git commit -m "message" -> Committolja a változtatásokat. Ezeket lehet majd felküldeni github-ra.  
git push -> Felküldi a github repo-ba a committokat.  
git checkout develop -> Develop branch-re váltás  
git checkout -b develop -> Develop branch létrehozása a mostani branch-ből és váltás a develop-ra  
git list -> Listázza milyen branch-ek elérhetőek  
git push --set-upstream origin feature -> Branch pusholása github repo-ba úgy, hogy a "feature" branch még csak a gépeden létezik, a github nem tud róla.

Pl. Ezt a módosítást úgy küldöm fel, hogy: A master branchen vagyok ami már létezik Github-on  
git add --all  
git commit -m "modified readme file"  
git push
