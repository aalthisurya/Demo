using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SlopeController : MonoBehaviour {

	public float Min, Max;


	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {

		var a = this.transform.parent.eulerAngles;

		print (a);


//		if (a.x > Min && a.x < Max) {
//			print ("Can Work x");
//		} else {
//			print("Cannot Work x");
//		}
//		if (a.y > Min && a.y < Max) {
//			print ("Can Work y ");
//		} else {
//			print("Cannot Work y");
//		}
//		if (a.z > Min && a.z < Max) {
//				print ("Can Work z");
//			} else {
//				print("Cannot Work z");
//			}
	}
}
