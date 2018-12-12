
using System.Collections;
using UnityEngine;

class Drag_snap : MonoBehaviour
{
	private bool dragging = false;
	private float distance;
	public Vector3 init_pos;
	RaycastHit hit;
	static public int cnt;
	public Vector3 screenSpace;
	public Vector3 offSet;
	public Camera cam;
	private bool dragRight = false;
	private bool dragLeft = false;
	private bool dragFront = false;
	private bool dragBack = false;

	public void Start ()
	{ 		
//		cam = GameObject.Find("Main Camera").GetComponent<Camera>();
	}

	void OnMouseDown ()
	{
//		init_pos = transform.position;
//		dragging =true;
//	
//		screenSpace = cam.WorldToScreenPoint(transform.position);//WorldToScreenPoint
//		offSet = transform.position-cam.ScreenToWorldPoint(new Vector3(Input.mousePosition.x, Input.mousePosition.y, screenSpace.z));//ScreenToWorldPoint
	}


	void OnMouseUp ()
	{
		RaycastHit hit;

		if (Physics.Raycast (transform.position, Vector3.right, out hit, 1f)) {
			GameObject other = hit.transform.gameObject;
			Vector3 pos = new Vector3 ((other.transform.position.x - other.GetComponent<Renderer> ().bounds.size.x/2 - gameObject.GetComponent<Renderer> ().bounds.size.x/2),
			other.transform.position.y,other.transform.position.z);
			transform.position = pos;

		}
			
		if (Physics.Raycast (transform.position, Vector3.left, out hit, 1f)) {
			GameObject other = hit.transform.gameObject;
			Vector3 pos = new Vector3 ((other.transform.position.x + other.GetComponent<Renderer> ().bounds.size.x/2 + gameObject.GetComponent<Renderer> ().bounds.size.x/2),
				other.transform.position.y,other.transform.position.z);
			transform.position = pos;
		}

		if (Physics.Raycast (transform.position, Vector3.forward, out hit, 1f)) {
			GameObject other = hit.transform.gameObject;
			Vector3 pos = new Vector3 ((other.transform.position.x ),
				other.transform.position.y,other.transform.position.z- other.GetComponent<Renderer> ().bounds.size.z/2 - gameObject.GetComponent<Renderer> ().bounds.size.z/2);
			transform.position = pos;
		}

		if (Physics.Raycast (transform.position, Vector3.back, out hit, 1f)) {
			GameObject other = hit.transform.gameObject;
			Vector3 pos = new Vector3 ((other.transform.position.x ),
			other.transform.position.y,other.transform.position.z+ other.GetComponent<Renderer> ().bounds.size.z/2 + gameObject.GetComponent<Renderer> ().bounds.size.z/2);
			transform.position = pos;
		}

		//

		dragging = false;

	}
	
	void Update ()
	{

		Vector3 newPosition ;

//		if (dragging) {
//			Vector3 curScreenSpace = new Vector3 (Input.mousePosition.x, Input.mousePosition.y, screenSpace.z);
//			Vector3 curPosition = cam.ScreenToWorldPoint (curScreenSpace) + offSet;//ScreenToWorldPoint
//			 newPosition = new Vector3 (curPosition.x, transform.position.y, curPosition.z);
//
//			transform.position = newPosition;

			RaycastHit hit;

			if (Physics.Raycast (transform.position, Vector3.right, out hit, GetComponent<Renderer> ().bounds.size.x*0.5f+1)) {
				GameObject other = hit.transform.gameObject;
				Vector3 pos = new Vector3 ((other.transform.position.x - other.GetComponent<Renderer> ().bounds.size.x/2 - gameObject.GetComponent<Renderer> ().bounds.size.x/2),
					other.transform.position.y,other.transform.position.z);


					transform.position = pos;

				dragRight = true;
			} 

			if (Physics.Raycast (transform.position, Vector3.left, out hit, GetComponent<Renderer> ().bounds.size.x*0.5f+1)) {
				GameObject other = hit.transform.gameObject;
				Vector3 pos = new Vector3 ((other.transform.position.x + other.GetComponent<Renderer> ().bounds.size.x/2 + gameObject.GetComponent<Renderer> ().bounds.size.x/2),
					other.transform.position.y,other.transform.position.z);


					transform.position = pos;
			
				dragLeft = true;

			}
			if (Physics.Raycast (transform.position, Vector3.forward, out hit,GetComponent<Renderer> ().bounds.size.z*0.5f+1)) {
				GameObject other = hit.transform.gameObject;
				Vector3 pos = new Vector3 ((other.transform.position.x ),
					other.transform.position.y,other.transform.position.z- other.GetComponent<Renderer> ().bounds.size.z/2 - gameObject.GetComponent<Renderer> ().bounds.size.z/2);


			
					transform.position = pos;
			
				dragFront = true;

			} 

			if (Physics.Raycast (transform.position, Vector3.back, out hit,GetComponent<Renderer> ().bounds.size.z*0.5f+ 1f)) {
				GameObject other = hit.transform.gameObject;
				Vector3 pos = new Vector3 ((other.transform.position.x ),
					other.transform.position.y,other.transform.position.z+ other.GetComponent<Renderer> ().bounds.size.z/2 + gameObject.GetComponent<Renderer> ().bounds.size.z/2);
				
					transform.position = pos;

				dragBack = true;

			} 
//		}
			
	}

	public void Reset(){
		Application.LoadLevel (0);
	}

	void OnPress(bool a1){
		if (a1 == true) {
			SendMessage("MouseDown", SendMessageOptions.DontRequireReceiver);
		}
		else {
			SendMessage("MouseUp", SendMessageOptions.DontRequireReceiver);
		}
	}
}