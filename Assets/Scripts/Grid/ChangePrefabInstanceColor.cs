using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangePrefabInstanceColor : Singleton<ChangePrefabInstanceColor>
{
    public void ChangeColor(GameObject targetObject, int newColor)
    {
        Renderer renderer = targetObject.GetComponent<Renderer>();
        if (renderer == null)
        {
            Debug.LogWarning($"GameObject {targetObject.name} không có Renderer.");
            return;
        }

        if (renderer.sharedMaterial != null)
        {
            renderer.material = new Material(renderer.sharedMaterial);
        }

        Color colorToApply;
        switch (newColor)
        {
            case 1: colorToApply = Color.red; break;
            case 2: colorToApply = Color.blue; break;
            case 3: colorToApply = Color.green; break;
            case 4: colorToApply = Color.yellow; break;
            case 5: colorToApply = Color.magenta; break;
            case 6: colorToApply = Color.cyan; break;
            case 7: colorToApply = new Color(0.5f, 0.25f, 0.75f); break; 
            case 8: colorToApply = new Color(1.0f, 0.5f, 0.0f); break;
            case 9: colorToApply = new Color(0.3f, 0.6f, 0.9f); break; 
            case 10: colorToApply = new Color(0.8f, 0.8f, 0.8f); break; 
            default:
                Debug.LogWarning($"Mã màu {newColor} không hợp lệ. Chọn giá trị từ 1 đến 10.");
                return;
        }

        if (renderer.material.HasProperty("_BaseColor"))
        {
            renderer.material.SetColor("_BaseColor", colorToApply);
        }
        else if (renderer.material.HasProperty("_Color"))
        {
            renderer.material.SetColor("_Color", colorToApply);
        }
        else
        {
            Debug.LogError($"Material của {targetObject.name} không hỗ trợ thuộc tính '_BaseColor' hoặc '_Color'.");
        }
    }
}
