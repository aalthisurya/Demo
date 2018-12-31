using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using VRTK;




public class RayCheck : MonoBehaviour {


	void Update(){

//		Transform origin = this.transform;
//
//		print (origin);

		if(Input.GetMouseButtonDown(0)) {
			Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
			RaycastHit physicsHit;

			if(Physics.Raycast(ray, out physicsHit, 10000)) {
				NavMeshHit navmeshHit;
				int walkableMask = 1 << NavMesh.GetAreaFromName("Walkable");
				if (NavMesh.SamplePosition (physicsHit.point, out navmeshHit, 1.0f, walkableMask)) {
					print ("True");
				} else {
					print ("false");
				}
			}
		}



}

//
//	void CheckRay(RaycastHit physicsHit){
//	
//		if(Physics.Raycast(ray, out physicsHit, 10000)) {
//			NavMeshHit navmeshHit;
//			int walkableMask = 1 << NavMesh.GetAreaFromName("Walkable");
//			if (NavMesh.SamplePosition (physicsHit.point, out navmeshHit, 1.0f, walkableMask)) {
//				print ("True");
//			} else {
//				print ("false");
//			}
//		}
//	}
//

}
