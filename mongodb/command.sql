//Creation de la table
db.createCollection("id_base")


//Remplissage de la base



db.departement.find({code : {$elementMatch :{$and:[{$type : "int"},{$mod: [2,0]}]}}})


db.departement.find({$and : [{code : {$type : "int"}}, {code : {$mod: [2,0]}}]})

db.departement.find({code : /.*4$/}).sort({code:1})


db.departement.find({code: {$exists:true}}).forEach( function(x) {db.departement.update({_id: x._id}, {$set: {code: x.code.toString()}});});




db.region.find([
   {
     $lookup:
       {
         from: "departement",
         localField: "region",
         foreignField: "denomination",
         as: "inventory_docs"
       }
  }
],{inventory_docs.region : "Auvergne-Rhone-Alpes"})


