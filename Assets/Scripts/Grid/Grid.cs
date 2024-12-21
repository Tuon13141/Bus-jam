using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Grid : MonoBehaviour
{
    public Vector2 Position;
    public Passenger Passenger;

    public Grid UpGrid;
    public Grid DownGrid;
    public Grid LeftGrid;
    public Grid RightGrid;

    public bool canTouch = false;
    public bool isEmpty = true;
}
