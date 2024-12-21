using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class GridGenerator : MonoBehaviour
{
    public Passenger PassengerPref;
    public Grid GridPref;
    public int Level;
    GridManager GridManager;

    public Vector3 offSet;

    public Transform gridParent;
    public Transform passengerParent;
    public GameObject mapObject;

    // Reference to the main camera
    public Camera mainCamera;

    private void Start()
    {
        GridManager = GridManager.Instance;
        GenerateMap(Level);
    }

    public void GenerateMap(int level)
    {
        string path = $"levels/{level}";
        TextAsset jsonFile = Resources.Load<TextAsset>(path);
        if (jsonFile == null)
        {
            Debug.LogError($"JSON file not found at path: {path}");
            return;
        }

        LevelData levelData = JsonUtility.FromJson<LevelData>(jsonFile.text);

        GridManager.Grids.Clear();

        Grid[,] gridArray = new Grid[levelData.gridY, levelData.gridX];
        for (int x = 0; x < levelData.gridY; x++)
        {
            for (int y = 0; y < levelData.gridX; y++)
            {
                Vector3 gridPosition = new Vector3(y, 0, x) + offSet; 
                float xOffSet = 1f;

                Vector3 worldPosition = new Vector3(y * offSet.z - (float)levelData.gridX + xOffSet, 0, - x * offSet.x);

                Grid newGrid = Instantiate(GridPref);
                newGrid.transform.position = worldPosition;
                newGrid.transform.parent = gridParent;
                newGrid.Position = new Vector2(x, y);

                GridManager.Grids.Add(newGrid);

                gridArray[x, y] = newGrid;

                var passengerData = levelData.cellMatrix[x].cellArray[y].passengers;
                if (passengerData != null && passengerData.Count > 0)
                {
                    Passenger newPassenger = Instantiate(PassengerPref, worldPosition, Quaternion.identity);
                    newPassenger.Color = passengerData[0].color;

                    newPassenger.Grid = newGrid;
                    newGrid.Passenger = newPassenger;

                    newGrid.isEmpty = false;
                    newPassenger.OnStart();
                    newPassenger.transform.parent = passengerParent;
                }
            }
        }

        for (int x = 0; x < levelData.gridY; x++)
        {
            for (int y = 0; y < levelData.gridX; y++)
            {
                Grid currentGrid = gridArray[x, y];
                if (currentGrid == null) continue;

                currentGrid.UpGrid = x > 0 ? gridArray[x - 1, y] : null;
                currentGrid.DownGrid = x < levelData.gridY - 1 ? gridArray[x + 1, y] : null;
                currentGrid.LeftGrid = y > 0 ? gridArray[x, y - 1] : null;
                currentGrid.RightGrid = y < levelData.gridX - 1 ? gridArray[x, y + 1] : null;
            }
        }

        // Apply camera settings from cameraPreset
        if (levelData.cameraPreset != null)
        {
            CameraPresetData cameraPreset = levelData.cameraPreset;

            if (mainCamera != null)
            {
                mainCamera.transform.position = new Vector3(cameraPreset.cameraPosition.x, cameraPreset.cameraPosition.y, cameraPreset.cameraPosition.z);
                mainCamera.transform.rotation = Quaternion.Euler(cameraPreset.cameraRotation.x, cameraPreset.cameraRotation.y, cameraPreset.cameraRotation.z);
                mainCamera.fieldOfView = cameraPreset.cameraFov;
            }
        }

        mapObject.transform.position = new Vector3(mapObject.transform.position.x, mapObject.transform.position.y - levelData.gridX , mapObject.transform.position.z);
    }
}

// JSON Data Structure
[System.Serializable]
public class LevelData
{
    public int gridX;
    public int gridY;
    public List<RowData> cellMatrix;
    public CameraPresetData cameraPreset;
}

[System.Serializable]
public class RowData
{
    public List<CellData> cellArray;
}

[System.Serializable]
public class CellData
{
    public List<PassengerData> passengers;
}

[System.Serializable]
public class PassengerData
{
    public int color;
}

[System.Serializable]
public class CameraPresetData
{
    public Vector3 cameraPosition;
    public Vector3 cameraRotation;
    public float cameraFov;
}
