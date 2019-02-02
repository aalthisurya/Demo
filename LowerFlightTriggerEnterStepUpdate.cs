using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LowerFlightTriggerEnterStepUpdate : LowerFlight {

	public LowerFlight lowerFlight;


	void Start () {

		lowerFlight = new LowerFlight ();

	}

	void OnTriggerEnter(Collider collider)
	{
		print ("Enter");
		LowerFlight.ID++;
		print ("lowerFlight.ID" + LowerFlight.ID);
	}
}
