using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Passenger : MonoBehaviour, IOnStart
{
    public Grid Grid { get; set; }
    public int Color;

    public GameObject AnimationCharactor;
    public GameObject StaticCharactor;

    public void OnStart()
    {
        ChangeColor();
    }
    public void ChangeColor()
    {
        ChangePrefabInstanceColor.Instance.ChangeColor(StaticCharactor, Color);
        ChangePrefabInstanceColor.Instance.ChangeColor(AnimationCharactor, Color);
    }
}
