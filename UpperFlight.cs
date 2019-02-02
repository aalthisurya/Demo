using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UpperFlight : MonoBehaviour {
	public int ID;

	public Text Heading,Heading1,Process;


	// Use this for initialization
	void Start () 
	{
		ID = 1;
	}




	// Update is called once per frame
	void Update ()
	{
		if (ID == 1) {
			Heading.text = "Tools Required";
			Process.text = "Tools Required ";
		}

		if (ID == 2) {
			Heading.text = "Preconditions";
//			Heading1.text = "Helicopter leveling";
			Process.text = "place clinometer";
		}

		if (ID == 3) {
			//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "check for accuracy of ± 2’ in longitudinal axes in clinometer";
		}

		if (ID == 4) {
			//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "check for accuracy of ± 2’ in lateral axes in clinometer";
		}

		if (ID == 5) {
			//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "Rigging of lower control system to be completed";
		}

		if (ID == 6) {
			//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "All measurements have to be perpendicular to the blade axis";
		}

		if (ID == 7) {
			//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "place rigging tool  No. ALH – 9655 on yellow  blade number";
		}

		if (ID == 8) {
			//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "place clinometer on tool";
		}

		if (ID == 9) {
			//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "place tool No ALH –SK-1304  on MGB";
		}

		if (ID == 10) {
			//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "Insert Pointer tool No. ALH – 9624 in main bolt to measure angle";
		}




		/////////////////////////////////Collective input Vs. Blade Angle//////////////////////////////////////
		if (ID == 11) {
			Heading.text = "Collective input Vs. Blade Angle";
			Heading1.text = "Pre condition";
			Process.text = "Use Tool No. ALH – 9646 for locking the cyclic ";
		}
		if (ID == 12) {
			//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "Use protractor to bring yellow blade at 0 degree";
		}
		if (ID == 13) {
			//			Heading.text = "Preconditions";
			//						Heading1.text = "Helicopter leveling";
			Process.text = "Pull Collective lever Max  Up ";
		}
		if (ID == 14) {
			//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "measure reading on clinometer and enter in table";
		}
		if (ID == 15) {
			//			Heading.text = "Preconditions";
			//			Heading1.text = "Helicopter leveling";
			Process.text = "now take measurement of yellow blade at 90, 180, 270 degree";
		}

		if (ID == 16) {
//			Heading.text = "Procedure ";
//			Heading1.text = "Collective control channel";
			Process.text = "take the mean value and enter in table";
		}

		if (ID == 17) {
			Process.text = "ensure reading as 9 degree+/-10 min";
		}

		if (ID == 18) {
			Process.text = "Collective lever Max. Down";
		}


		if (ID == 19) {
			Process.text = "again Use protractor to bring yellow blade at 0 degree";
		}

		if (ID == 20) {
			Process.text = "measure the reading and enter in table\n";
		}

		if (ID == 21) {
			Process.text = "now take measurement of yellow blade at 90, 180, 270 degree ";
		}

		if (ID == 22) {
			Process.text = "take the mean value and enter in table";
		}

		if (ID == 23) {
			Process.text = "ensure reading as -8 degree 50 min to -9 degree";
		}

		if (ID == 24) {
			Process.text = "If the mean value not met, adjust the length of the connecting rod by turning ";
		}





		/////////////////////////////////Cyclic input Vs. Blade Angle/////////////////////////////////////
		if (ID == 25) {
			Heading.text = "Cyclic input Vs. Blade Angle";
			Heading1.text = "Pre condition";
			Process.text = "put collective down";
		}

		if (ID == 26) {
			Process.text = "measure the blade angle on clinomter as per condition shown in table ";
		}
		if (ID == 27) {
			Process.text = "If the value not met, adjust the length of the connecting rod by turning";
		}


		/////////////////////////////////Collective, Longitudinal and Lateral Combined/////////////////////////////////////

		if (ID == 28) {
			Heading1.text = "Collective, Longitudinal and Lateral Combined";
			Process.text = "Measure the blade angle as per conditions shown \n";
		}
		if (ID == 29) {

			Heading1.text = "Final Settings";
			Process.text = "Wire lock all nuts";
		}
		if (ID == 30) {
			Process.text = "Recharge hyd package";
		}

		if (ID == 31) {
			Process.text = "Check all connections";
		}

		if (ID == 32) {
			Process.text = "Check for any FOD";
		}

		if (ID == 33) {
			Process.text = "Deliver aircraft for next vibration checks.";
		}

	
	}
}
