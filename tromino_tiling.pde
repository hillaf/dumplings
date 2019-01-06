
float[][] tiles;
int spacer;
int k = 32;

void setup() {
  size(640, 640);
  tiles = new float[k][k];
  spacer = 20;
  int missing_x = int(random(0, k));
  int missing_y = int(random(0, k));
  println("Missing x: " + missing_x);
  println("Missing y: " + missing_y);
  
  for (int y = 0; y < k; y++) {
    for (int x = 0; x < k; x++) {
      if (x == missing_x && y == missing_y){
        tiles[x][y] = 255;
      } else {   
        tiles[x][y] = 0;
      }
    }
  }
  
  tile(k, 0, 0, missing_x, missing_y);
  
  strokeWeight(10);
}


void tile(int n, int start_x, int start_y, int missing_x, int missing_y){
 
  // base case
  if (n == 1){
     println("x: " + start_x + " y: " + start_y + " missing x: " +missing_x + " missing y: " + missing_y); 
   } else {
    int middle = (n/2);
    println(middle);
    int middle_x = start_x + middle;
    int middle_y = start_y + middle;
   
     
    int x1 = start_x;
    int y1 = start_y;
    int x2 = start_x;
    int y2 = start_y;
    int x3 = start_x;
    int y3 = start_y;
    
    if (missing_x < middle_x){
      x1 = middle_x;
      y1 = middle_y;
      x2 = middle_x;
      y2 = middle_y-1;
      if (missing_y >= middle_y){
        x3 = middle_x-1;
        y3 = middle_y-1;
      } else {
        x3 = middle_x-1;
        y3 = middle_y;
      }
    } else {
      x1 = middle_x-1;
      y1 = middle_y-1;
      x2 = middle_x-1;
      y2 = middle_y;
      if (missing_y >= middle_y){
        x3 = middle_x;
        y3 = middle_y-1;
      } else {
        x3 = middle_x;
        y3 = middle_y;
      }
    }
    
   tiles[x1][y1] = map(n, 0, k, 20, 230);
   tiles[x2][y2] = map(n, 0, k, 20, 230);
   tiles[x3][y3] = map(n, 0, k, 20, 230);

   
   if (x1 == middle_x && y3 == middle_y) {
     tile(middle, start_x, start_y, missing_x, missing_y);
     tile(middle, middle_x, middle_y, x1, y1);
     tile(middle, start_x, middle_y, x2, y2);
     tile(middle, middle_x, start_y, x3, y3);
   } else if (x1 == middle_x && y3 == middle_y-1){
     tile(middle, start_x, start_y, x3, y3);
     tile(middle, middle_x, middle_y, x1, y1);
     tile(middle, start_x, middle_y, missing_x, missing_y);
     tile(middle, middle_x, start_y, x2, y2);
   } else if (x1 == middle_x-1 && y3 == middle_y){
     tile(middle, start_x, start_y, x1, y1);
     tile(middle, middle_x, middle_y, x3, y3);
     tile(middle, start_x, middle_y, x2, x2);
     tile(middle, middle_x, start_y, missing_x, missing_y);
   } else if (x1 == middle_x-1 && y3 == middle_y-1){
     tile(middle, start_x, start_y, x1, y1);
     tile(middle, middle_x, start_y, x2, y2);
     tile(middle, start_x, middle_y, x3, y3);
     tile(middle, middle_x, middle_y, missing_x, missing_y);
   }
   
  }
}


void draw() {
  background(0);

  for (int y = 0; y < k; y++) {
    for (int x = 0; x < k; x++) {
      fill(tiles[x][y]);
      stroke(tiles[x][y]);
      rect((x*spacer)+spacer/5, (y*spacer)+spacer/5, spacer/2, spacer/2);
    }
  }
}
