
/*
Affinitomics API Swift Example Library
Copyright (C) 2016 Prefrent
*/

/*
Version: 0.7
Author: Prefrent
Author URI: http://prefrent.com
*/

/*
NOTE:
Use of this program requires an Affinitomics API key
Please go to Affinitomics.com to register for an API key
*/


// +----------------------------------------------------------------------+
// | This program is free software; you can redistribute it and/or modify |
// | it under the terms of the GNU General Public License, version 2, as  |
// | published by the Free Software Foundation.                           |
// |                                                                      |
// | This program is distributed in the hope that it will be useful,      |
// | but WITHOUT ANY WARRANTY; without even the implied warranty of       |
// | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        |
// | GNU General Public License for more details.                         |
// |                                                                      |
// | You should have received a copy of the GNU General Public License    |
// | along with this program; if not, write to the Free Software          |
// | Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,               |
// | MA 02110-1301 USA                                                    |
// +----------------------------------------------------------------------+


import Foundation
   
let testDomain1 = "affinitomics_ex_swift"       //example domain name, user defined to be anything
let testDomain2 = "affinitomics_ex_swift_2"     //example domain name, user defined to be anything

let completionFunc = completionTest


// function checks to make sure an Affinitomcis API key has been added to the example
func checkKey() -> Bool
{
    if (g_apiKey.characters.count > 0)
    {
        return true
    }
    
    print ("\n")
    print ("NOTE: An Affinitomics API Key is necessary to use this example ")
    print ("Please go to Affinitomics.com to obtain a key ")
    print ("Once you have obtained an API key, set the g_apiKey variable in the affinitomics_api_lib.swift file and run this example again.")
    print ("\n")
    return false
}

func runQueries()
{
    //check to ensure an Affinitomics API key has been added before running any of the queries
    if (checkKey())
    {
        setupArchetypes()
        domains()
        archetypes()
        archetypeInfo()
        related()
    }

}

func archetypeInfo()
{
    var completionDict:NSDictionary = [:]

    getArchetypeInfo(
        "viper",                                    //the id of the archetype that we want to retrieve info for
        domain: testDomain1, 						//the domain from which we want to retrieve the archetype info
        completionData: completionDict,             //the dictionary of completion data that will be used by the completion function to handle the return data from the Affinitomics api server
        onCompletion: completionFunc                //callback function that will handle the information returned from the affinitomics server
    )
}


func related()
{
    var completionDict:NSDictionary = [:]
    
    getRelatedArchetypes(
        "viper",                                    //the id of the archetype that we want to retrieve info for
        domain: testDomain1, 						//the domain from which we want to retrieve the archetype info
        matches_limit: "5",                         //max number of related matches to return
        category_filter: "",                        //the category filter to use when finding matches (to use this, archetypes must have categories assigned to them previously)
        completionData: completionDict,             //the dictionary of completion data that will be used by the completion function to handle the return data from the Affinitomics api server
        onCompletion: completionFunc                //callback function that will handle the information returned from the affinitomics server
    )
}


func archetypes()
{
    var completionDict:NSDictionary = [:]
    
    getArchetypesByDomain(
        testDomain1,                                //the domain from which we want to retrieve the archetype info
        completionData: completionDict,             //the dictionary of completion data that will be used by the completion function to handle the return data from the Affinitomics api server
        onCompletion: completionFunc                //callback function that will handle the information returned from the affinitomics server
    )
    
    getArchetypes(
        completionDict,                             //the dictionary of completion data that will be used by the completion function to handle the return data from the Affinitomics api server
        onCompletion: completionFunc                //callback function that will handle the information returned from the affinitomics server
    )

}

func domains()
{
    var completionDict:NSDictionary = [:]
    
    getDomains(completionDict, onCompletion: completionFunc)
}


func setupArchetypes()
{
    var completionDict:NSDictionary = [:]
    
    syncArchetype(
        "horse",                                    //the id of the archetype that we want to retrieve info for
        domain: testDomain1, 						//the domain from which we want to retrieve the archetype info
        descriptors: "horse", 						//descriptors for the archetype
        draws: "horse, horses", 					//draws for the archetype 		(positive values)
        distances: "bicycle, car", 					//distances for the archetype 	(negative values)
        title: "",                                  //the title for the archetype, if there is one
        categories: "",                             //any categories that may want to be added to the archetype
        sets: "",                                   //any sets that we want this archetype to belong to.  Set will be created if it currently does not exist
        status: "", 								//status of the archetype (used mainly to indicate published status and to help separate archetypes)
        completionData: completionDict,             //the dictionary of completion data that will be used by the completion function to handle the return data from the Affinitomics api server
        onCompletion: completionFunc                //callback function that will handle the information returned from the affinitomics server
    )
    
    
    syncArchetype(
        "motorcycle",                               //the id of the archetype to be synced. Will be created if the archetype does not currently exist
        domain: testDomain1, 						//the domain from which we want to retrieve the archetype info
        descriptors: "bicycle",						//descriptors for the archetype
        draws: "car, skateboard", 					//draws for the archetype 		(positive values)
        distances: "horses, horse", 				//distances for the archetype 	(negative values)
        title: "",                                  //the title for the archetype, if there is one
        categories: "",                             //any categories that may want to be added to the archetype
        sets: "",                                   //any sets that we want this archetype to belong to.  Set will be created if it currently does not exist
        status: "", 								//status of the archetype (used mainly to indicate published status and to help separate archetypes)
        completionData: completionDict,             //the dictionary of completion data that will be used by the completion function to handle the return data from the Affinitomics api server
        onCompletion: completionFunc                //callback function that will handle the information returned from the affinitomics server
    )
    
    syncArchetype(
        "viper",                                    //the id of the archetype to be synced. Will be created if the archetype does not currently exist
        domain: testDomain1, 						//the domain from which we want to retrieve the archetype info
        descriptors: "car", 						//descriptors for the archetype
        draws: "bicycle, moped, skateboard", 		//draws for the archetype 		(positive values)
        distances: "horses, horse", 				//distances for the archetype 	(negative values)
        title: "",                                  //the title for the archetype, if there is one
        categories: "",                             //any categories that may want to be added to the archetype
        sets: "",                                   //any sets that we want this archetype to belong to.  Set will be created if it currently does not exist
        status: "", 								//status of the archetype (used mainly to indicate published status and to help separate archetypes)
        completionData: completionDict,             //the dictionary of completion data that will be used by the completion function to handle the return data from the Affinitomics api server
        onCompletion: completionFunc                //callback function that will handle the information returned from the affinitomics server
    )
    
    syncArchetype(
        "cuda",                                     //the id of the archetype to be synced. Will be created if the archetype does not currently exist
        domain: testDomain1, 						//the domain from which we want to retrieve the archetype info
        descriptors: "bicycle",                     //descriptors for the archetype
        draws: "car, moped, skateboard", 			//draws for the archetype 		(positive values)
        distances: "horses, horse", 				//distances for the archetype 	(negative values)
        title: "",                                  //the title for the archetype, if there is one
        categories: "",                             //any categories that may want to be added to the archetype
        sets: "",                                   //any sets that we want this archetype to belong to.  Set will be created if it currently does not exist
        status: "", 								//status of the archetype (used mainly to indicate published status and to help separate archetypes)
        completionData: completionDict,             //the dictionary of completion data that will be used by the completion function to handle the return data from the Affinitomics api server
        onCompletion: completionFunc                //callback function that will handle the information returned from the affinitomics server
    )
    
    syncArchetype(
        "bike",                                     //the id of the archetype to be synced. Will be created if the archetype does not currently exist
        domain: testDomain1, 						//the domain from which we want to retrieve the archetype info
        descriptors: "bicycle",                     //descriptors for the archetype
        draws: "car, moped, skateboard", 			//draws for the archetype 		(positive values)
        distances: "horses, horse", 				//distances for the archetype 	(negative values)
        title: "",                                  //the title for the archetype, if there is one
        categories: "",                             //any categories that may want to be added to the archetype
        sets: "",                                   //any sets that we want this archetype to belong to.  Set will be created if it currently does not exist
        status: "", 								//status of the archetype (used mainly to indicate published status and to help separate archetypes)
        completionData: completionDict,             //the dictionary of completion data that will be used by the completion function to handle the return data from the Affinitomics api server
        onCompletion: completionFunc                //callback function that will handle the information returned from the affinitomics server
    )
}


func completionTest(params : NSDictionary, completionDict : NSDictionary, callType : String)
{
    //this is an example completion function 
    // the user should create their own function to handle the return data as they see fit
    
    print("completed call")
    print(callType)
    
    for (key, value) in params
    {
        print("Property key: \"\(key as! String)\"")
    }
    
}
