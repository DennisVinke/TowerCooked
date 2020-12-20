class CollisionManager
{
    ArrayList<GameObject> gameObjects;
    
    CollisionManager(){
        gameObjects = new ArrayList<GameObject>();
    }

    void addToGameObjects(GameObject ob){
        gameObjects.add(ob);
    }

    void removeFromGameObjects(GameObject ob){
        gameObjects.remove(ob);
    }


}
