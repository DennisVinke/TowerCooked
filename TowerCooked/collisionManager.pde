static class CollisionManager
{
    static ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
;
    

    static void addToGameObjects(GameObject ob){
        gameObjects.add(ob);
    }

    static void removeFromGameObjects(GameObject ob){
        gameObjects.remove(ob);
    }

    static GameObject collision(GameObject ob){
        for(GameObject gb : gameObjects){
            if(gb == ob){
                continue;
            }
            if(CollisionManager.checkCollision(ob,gb)){
                println(gb);
                return gb;
            }
        }
        return null;
    }
    
    static boolean checkCollision(GameObject ob, GameObject gb){
        boolean collide = false;
        PVector obPos = new PVector(ob.xPos, ob.yPos);
        PVector gbPos = new PVector(gb.xPos, gb.yPos);
        
        PVector distanceVect = PVector.sub(obPos, gbPos);

        // Calculate magnitude of the vector separating the balls
        float distanceVectMag = distanceVect.mag();

        // Minimum distance before they are touching
        float minDistance = ob.size + gb.size;

        if (distanceVectMag <= minDistance) {
            collide = true;
        }
        return collide;
    }

    static boolean checkCollisionBase(GameObject ob){
        return false;
    }

}
