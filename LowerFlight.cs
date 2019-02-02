using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class LowerFlight : MonoBehaviour {


	public static int ID;

	public Text Heading,Heading1,Process;

	public float waitingTime = 5f;

	bool CanUpate;

	public Transform[] TargetObject;
	public Transform[] TargetPosition;

	// Use this for initialization
	void Start () 
	{
		ID = 1;
		CanUpate = true;
	}



	void ActivatePortal(int a)
	{
		for (int i = 0; i < TargetObject.Length; i++) {
			TargetObject[i].gameObject.SetActive(false);
			TargetPosition[i].gameObject.SetActive(false);	
		}
		
		TargetObject[a].gameObject.SetActive(true);
		TargetPosition[a].gameObject.SetActive(true);
	}



	// Update is called once per frame
	void Update ()
	{
		if (ID == 1) {
			Heading.text = "Tools Required";
			Process.text = "Tools Required ";
			ChangeNextStep ();

		}


		if (ID == 2) {
			Heading.text = "Preconditions";
			Heading1.text = "Helicopter leveling";
			Process.text = "Place weighing beam ";
			ActivatePortal (ID);
		}

		if (ID == 3) {
//			Heading.text = "Preconditions";
//			Heading1.text = "Helicopter leveling";
			Process.text = "Place jacks 01";
		}

		if (ID == 4) {
//			Heading.text = "Preconditions";
//			Heading1.text = "Helicopter leveling";
			Process.text = "Place jacks 02";
		}

		if (ID == 5) {
//			Heading.text = "Preconditions";
//			Heading1.text = "Helicopter leveling";
			Process.text = "Place jacks 03";
		}

		if (ID == 6) {
//			Heading.text = "Preconditions";
//			Heading1.text = "Helicopter leveling";
			Process.text = "Place clinometer ";
		}

		if (ID == 7) {
//			Heading.text = "Preconditions";
//			Heading1.text = "Helicopter leveling";
			Process.text = "Place clinometer";
		}

		if (ID == 8) {
//			Heading.text = "Preconditions";
//			Heading1.text = "Helicopter leveling";
			Process.text = "Disconnect trim actuator 01";
		}

		if (ID == 9) {
//			Heading.text = "Preconditions";
//			Heading1.text = "Helicopter leveling";
			Process.text = "Disconnect trim actuator 02";
		}

		if (ID == 10) {
//			Heading.text = "Preconditions";
//			Heading1.text = "Helicopter leveling";
			Process.text = "Disconnect trim actuator 03";
		}
		if (ID == 11) {
//			Heading.text = "Preconditions";
//			Heading1.text = "Helicopter leveling";
			Process.text = "Engage the rigging pin tool ALH-SK-H-493";
		}
		if (ID == 12) {
//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "Place Clinometer mounting tool ALH-SK-TP-110 ";
		}
		if (ID == 13) {
//			Heading.text = "Preconditions";
//						Heading1.text = "Helicopter leveling";
			Process.text = "Now place clinometer ";
		}
		if (ID == 14) {
//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "In case of any deviation adjust the Fwd";
		}
		if (ID == 15) {
			//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "Remove rigging pin";
		}

		if (ID == 16) {
			Heading.text = "Procedure ";
			Heading1.text = "Collective control channel";
			Process.text = "Turn stopper nuts of collective circuit completely backwards";
		}

		if (ID == 17) {
			Process.text = "Place ALH-9504 to set the pilot collective lever at lower most position.";
		}

		if (ID == 18) {
			Process.text = "Loosen the check nuts of control rod";
		}


		if (ID == 19) {
			Process.text = "Bring the input lever fully forward by adjusting tie ends";
		}

		if (ID == 20) {
			Process.text = "Place Vernier caliper ";
		}

		if (ID == 21) {
			Process.text = "Adjust the control rod till Vernier caliper reads piston movement of 0.2 to 0.4 mm";
		}

		if (ID == 22) {
			Process.text = "Tighten the check nuts ";
		}

		if (ID == 23) {
			Process.text = "Adjust the top stopper nut (loc) to set  collective stick at lowest position ";
		}

		if (ID == 24) {
			Process.text = "Move collective stick upwards till actuator input lever moves back completely";
		}

		if (ID == 25) {
			Process.text = "place Vernier caliper.";
		}

		if (ID == 26) {
			Process.text = "move collective downwards till the Vernier caliper indicates 0.2 to 0.4 mm";
		}
		if (ID == 27) {
			Process.text = "Adjust the bottom stopper nut";
		}
		if (ID == 28) {
			Heading1.text = "Ensure for correct adjustment";
			Process.text = "move collective full fwd";
		}
		if (ID == 29) {
			Process.text = "measure piston stroke by placing Vernier caliper";
		}
		if (ID == 30) {
			Process.text = "move collective full back";
		}

		if (ID == 31) {
			Process.text = "measure piston stroke by placing Vernier caliper";
		}

		if (ID == 32) {
			Process.text = "ensure reading as 56.3 to 56.9 mm by subtracting both measurements";
		}

		if (ID == 33) {
			Process.text = "ensure pilot collective travel as shown ";
		}

		if (ID == 34) {
			Heading1.text = "for co-pilot";
			Process.text = "Bring pilot stick to lowermost position";
		}

		if (ID == 35) {
			Process.text = "Place tool ALH-9504";
		}

		if (ID == 36) {
			Process.text = "Bring co-pilot stick to lowermost position , by adjusting the link rod";
		}
		if (ID == 37) {
			Process.text = "ensure co-pilot collective travel as shown";
		}





		/////////////////////////////////////////Cyclic Longitudinal Channel/////////////////////////////////////////

		if (ID == 38) {
			Heading1.text = "Cyclic Longitudinal Channel";
			Process.text = "Turn the stopper bolts completely backwards";
		}
		if (ID == 39) {
			Process.text = "Attach clinometer-mounting tool ALH-9702 ";
		}
		if (ID == 40) {
			Process.text = "Place clinometer";
		}

		if (ID == 41) {
			Process.text = "Move the stick forward so that the clinometer reads 10° 26’. ";
		}
		if (ID == 42) {
			Process.text = "tighten lock nut to restricts further movement";
		}
		if (ID == 43) {
			Process.text = "Loosen the check nuts of control rod";
		}
		if (ID == 44) {
			Process.text = "bring the input lever fully forward by adjusting control rod";
		}
		if (ID == 45) {
			Process.text = "place Vernier caliper";
		}
		if (ID == 46) {
			Process.text = "adjust tie ends till Vernier caliper reads piston movement 3.8 to 4.0 mm";
		}
		if (ID == 47) {
			Process.text = "Tighten the check nuts";
		}
		if (ID == 48) {
			Process.text = "Move the stick aft till the actuator input lever moves backwards completely";
		}
		if (ID == 49) {
			Process.text = "place Vernier caliper";
		}
		if (ID == 50) {
			Process.text = "move cyclic forward till the Vernier caliper indicates 0.2 to 0.4 mm";
		}
		if (ID == 51) {
			Process.text = "Engage the stopper bolt ";
		}
		if (ID == 52) {
			Heading1.text = "Ensure for correct adjustment";
			Process.text = "Move cyclic full fwd";
		}
		if (ID == 53) {
			Process.text = "measure piston stroke by placing Vernier caliper";
		}
		if (ID == 54) {
			Process.text = "move cyclic full back";
		}
		if (ID == 55) {
			Process.text = "measure piston stroke by placing Vernier caliper";
		}
		if (ID == 56) {
			Process.text = "ensure reading as 60.3 to 61.3 mm by subtracting both measurements";
		}
		if (ID == 57) {
			Process.text = "ensure cyclic stick travel as showns";
		}
	


		/////////////////////////////////////////Cyclic lateral channel/////////////////////////////////////////

		if (ID == 58) {
			Heading1.text = "Cyclic lateral channel";
			Process.text = "Turn the stopper bolts completely backwards";
		}
		if (ID == 59) {
			Process.text = "Mount clinometer in lateral axis.";
		}
		if (ID == 60) {
			Process.text = "Place clinometer";
		}

		if (ID == 61) {
			Process.text = "Move pilot cyclic sick to the left so that the clinometer reads 9° 13’";
		}
		if (ID == 62) {
			Process.text = "tighten lock nut to restricts further movement";
		}

		if (ID == 63) {
			Process.text = "bring the input lever fully forward by adjusting tie ends. while stick at leftward stop ";
		}
		if (ID == 64) {
			Process.text = "place Vernier caliper";
		}
		if (ID == 65) {
			Process.text = "adjust tie ends till Vernier caliper reads piston movement  0.2 to 0.4 mm";
		}
		if (ID == 66) {
			Process.text = "Tighten the check nuts";
		}
		if (ID == 67) {
			Process.text = "Move the stick rightwards till the actuator input lever moves backwards completely";
		}
		if (ID == 68) {
			Process.text = "place Vernier caliper";
		}
		if (ID == 69) {
			Process.text = "move cyclic forward till the Vernier caliper indicates 0.2 to 0.4 mm";
		}
		if (ID == 70) {
			Process.text = "Engage the stopper bolt ";
		}
		if (ID == 71) {
			Heading1.text = "Ensure for correct adjustment";
			Process.text = "move cyclic full rightward";
		}
		if (ID == 72) {
			Process.text = "measure piston stroke by placing Vernier caliper";
		}
		if (ID == 73) {
			Process.text = "move cyclic full leftward";
		}
		if (ID == 74) {
			Process.text = "measure piston stroke by placing Vernier caliper";
		}
		if (ID == 75) {
			Process.text = "ensure reading as 39.3 to 39.9 mm by subtracting both measurements.";
		}
		if (ID == 76) {
			Process.text = "ensure cyclic stick travel as showns";
		}
	}

	void ChangeNextStep()
	{

		if (CanUpate) 
		{
			Invoke ("UpdateStepCount", waitingTime);
			CanUpate = false;
		}
	}




	void UpdateStepCount()
	{
		ID++;
		StartCoroutine ("TimetoUpdateTrue");
	}


	IEnumerator TimetoUpdateTrue()
	{
		yield return new WaitForSeconds (3f);
		CanUpate = true;
	}
}
