using UnityEngine;
using Data;


public class GameManager : Singleton<GameManager>
{

    public UserData UserData
    {
        get; private set;
    }
    protected override void Awake()
    {
        base.Awake();
        Game.Launch();
        UserData = Game.Data.Load<UserData>();
        if (UserData.Init())
        {
            //BuildingManager.Instance.NeedTutorial = true;
        }

    }
   

    private void Start()
    {
        ChangeState(GameStates.Start);
    }

   
    [SerializeField] private GameStates _state = GameStates.Retry;
    public void ChangeState(GameStates newState)
    {
        if (newState == _state) return;
 
        _state = newState;
        EnterNewState();
    }

    private void EnterNewState()
    {
        switch (_state)
        {
            case GameStates.Tutorial:
                break;
            case GameStates.Home:
                break;
            case GameStates.Start:
                break;
            case GameStates.Play:
   
                break;
            case GameStates.Retry:
                break;
            case GameStates.Win:
                break;
            case GameStates.Lose:
                break;
            case GameStates.NextLevel:
          
                break;
            default:
                break;
        }
    }

}

public enum GameStates
{
    Play, Win, Lose, Home, Tutorial, Start, Retry, NextLevel
}
