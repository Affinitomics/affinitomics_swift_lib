
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


let g_serverUrl = "https://www.affinitomics.com"                                            //the Affinitomics server url
let g_apiKey = ""        //Affinitomics API Key  (goto Affinitomics.com to register for one)

let g_ctype = "af_lib_swift_ex"     //type of the client software (user defined)
let g_cversion = "0.7"              //version of the client software (user defined)

typealias ServiceResponse = (NSDictionary, NSDictionary, String) -> Void


func getDomains(completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    postTest(dataDict, url: g_serverUrl, callType: "RequestDomains", completionData: completionData, onCompletion: onCompletion)
}

func getArchetypes(completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    postTest(dataDict, url: g_serverUrl, callType: "RequestArchetypes", completionData: completionData, onCompletion: onCompletion)
}

func getArchetypesByDomain(domain : String, completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    dataDict["domain"] = domain
    
    postTest(dataDict, url: g_serverUrl, callType: "RequestArchetypesByDomain", completionData: completionData, onCompletion: onCompletion)
}

func getRelatedArchetypes(archetype_id : String, domain : String, matches_limit : String, category_filter : String, completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    dataDict["archetype_id"] = archetype_id
    dataDict["domain"] = domain
    dataDict["matches_limit"] = matches_limit
    dataDict["category_filter"] = category_filter
    
    postTest(dataDict, url: g_serverUrl, callType: "RequestRelatedArchetypes", completionData: completionData, onCompletion: onCompletion)
}

func rankAgainstArchetypes(archetype_id : String, domain : String, matches_limit : String, category_filter : String, rank_archetpye_ids : String, completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    dataDict["archetype_id"] = archetype_id
    dataDict["domain"] = domain
    dataDict["matches_limit"] = matches_limit
    dataDict["category_filter"] = category_filter
    dataDict["rank_archetpye_ids"] = rank_archetpye_ids
    
    postTest(dataDict, url: g_serverUrl, callType: "RankAgainstArchetypes", completionData: completionData, onCompletion: onCompletion)
}

func getArchetypeInfo(archetype_id : String, domain : String, completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    dataDict["archetype_id"] = archetype_id
    dataDict["domain"] = domain
    
    
    postTest(dataDict, url: g_serverUrl, callType: "RequestArchetypeInfo", completionData: completionData, onCompletion: onCompletion)
}

func removeArchetype(archetype_id : String, domain : String, completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    dataDict["archetype_id"] = archetype_id
    dataDict["domain"] = domain
    
    
    postTest(dataDict, url: g_serverUrl, callType: "RemoveArchetype", completionData: completionData, onCompletion: onCompletion)
}

func addSetToDomain(set_id : String, domain : String, completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    dataDict["set_id"] = set_id
    dataDict["domain"] = domain
    
    
    postTest(dataDict, url: g_serverUrl, callType: "AddSetToDomain", completionData: completionData, onCompletion: onCompletion)
}

func AddArchetypeToSet(archetype_id : String, set_id : String, domain : String, completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    dataDict["archetype_id"] = archetype_id
    dataDict["set_id"] = set_id
    dataDict["domain"] = domain
    
    
    postTest(dataDict, url: g_serverUrl, callType: "AddArchetypeToSet", completionData: completionData, onCompletion: onCompletion)
}

func removeArchetypeFromSet(archetype_id : String, set_id : String, domain : String, completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    dataDict["archetype_id"] = archetype_id
    dataDict["set_id"] = set_id
    dataDict["domain"] = domain
    
    
    postTest(dataDict, url: g_serverUrl, callType: "RemoveArchetypeFromSet", completionData: completionData, onCompletion: onCompletion)
}

func getArchetypesInSet(set_id : String, domain : String, completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    dataDict["set_id"] = set_id
    dataDict["domain"] = domain
    
    
    postTest(dataDict, url: g_serverUrl, callType: "GetArchetypesInSet", completionData: completionData, onCompletion: onCompletion)
}

func relateArchetypeWithSet(archetype_id : String, set_id : String, domain : String, matches_limit : String, category_filter : String, completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    dataDict["archetype_id"] = archetype_id
    dataDict["set_id"] = set_id
    dataDict["domain"] = domain
    dataDict["matches_limit"] = matches_limit
    dataDict["category_filter"] = category_filter
    
    postTest(dataDict, url: g_serverUrl, callType: "RelateArchetypeWithSet", completionData: completionData, onCompletion: onCompletion)
}

func syncArchetype(archetype_id : String, domain : String, descriptors : String, draws : String, distances : String, title : String, categories : String, sets : String, status : String, completionData : NSDictionary, onCompletion : ServiceResponse)
{
    var dataDict = Dictionary<String, String>()
    dataDict["archetype_id"] = archetype_id
    dataDict["domain"] = domain
    dataDict["descriptors"] = descriptors
    dataDict["draws"] = draws
    dataDict["distances"] = distances
    dataDict["title"] = title
    dataDict["categories"] = categories
    dataDict["sets"] = sets
    dataDict["status"] = status
    
    
    postTest(dataDict, url: g_serverUrl, callType: "SyncArchetype", completionData: completionData, onCompletion: onCompletion)
}





func postTest(var params : Dictionary<String, String>, var url : String, callType : String, completionData : NSDictionary, onCompletion: ServiceResponse)
{
    
    //create the randomly generated nonce value to help ensure security of api call
    var nonce : NSMutableString = NSMutableString(capacity: 60)
    
    for (var i=0; i < 60; i++)
    {
        let num = Int(arc4random_uniform(9)+1)
        nonce.appendString( String(num))
    }
    
    
    params["ctype"] = g_ctype
    params["cversion"] = g_cversion
    params["nonce"] = nonce as String
    params["user_key"] = g_apiKey
    
    url += "/api/"
    url += callType
    
    let request = NSMutableURLRequest(URL: NSURL(string: url)!)
    
    let session = NSURLSession.sharedSession()
    request.HTTPMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(params, options: [])
    
    
    
    let task = session.dataTaskWithRequest(request) { data, response, error in
        guard data != nil else {
            print("no data found: \(error)")
            return
        }
        
        // this, on the other hand, can quite easily fail if there's a server error, so you definitely
        // want to wrap this in `do`-`try`-`catch`:
        
        do {
            if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary
            {
                onCompletion(json, completionData, callType)
            }
            else
            {
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)    // No error thrown, but not NSDictionary
                print("Error could not parse JSON: \(jsonStr)")
            }
        }
        catch let parseError
        {
            print(parseError)                                                          // Log the error thrown by `JSONObjectWithData`
            let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("Error could not parse JSON: '\(jsonStr)'")
        }
    }
    
    task.resume()
}