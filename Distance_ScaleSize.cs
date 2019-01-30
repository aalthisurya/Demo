using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Distance_ScaleSize : MonoBehaviour {
	
		public Camera cam; 
		public float objectScale = 1.0f; 
		private Vector3 initialScale; 

		// set the initial scale, and setup reference camera
		void Start ()
		{

			initialScale = transform.localScale; 

			if (cam == null)
				cam = Camera.main; 
		}


		void Update () 
		{
			transform.LookAt(cam.gameObject.transform);
			Plane plane = new Plane(cam.transform.forward, cam.transform.position); 
			float dist = plane.GetDistanceToPoint(transform.position); 
			transform.localScale = initialScale * dist * objectScale; 
		}

}
