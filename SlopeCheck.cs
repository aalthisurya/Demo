using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using VRTK;



public class SlopeCheck : MonoBehaviour {

	public GameObject Temp;

	public Vector3 a;

	public Quaternion b;

	// Use this for initialization
	void Start () {

	}
	
	// Update is called once per frame
	void Update () {
		b = this.GetComponent<VRTK_StraightPointerRenderer> ().Quat.rotation;
		a = this.GetComponent<VRTK_StraightPointerRenderer> ().TempPost;
		Temp.transform.position = new Vector3 (a.x,a.y,a.z);
		Temp.transform.rotation = new Quaternion (b.x,b.y,b.z,b.w);
	}



}
