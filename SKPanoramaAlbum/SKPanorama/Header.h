//
//  Header.h
//  DaoJiaLe
//
//  Created by Somer.King on 17/3/20.
//  Copyright © 2017年 Somer. All rights reserved.
//

#ifndef Header_h
#define Header_h


#define ES_PI  (3.14159265f)
#define MAX_OVERTURE 95.0
#define MIN_OVERTURE 25.0
#define DEFAULT_OVERTURE 85.0
#define ES_PI  (3.14159265f)
#define ROLL_CORRECTION ES_PI/2.0
#define FramesPerSecond 30
#define SphereSliceNum 200
#define SphereRadius 1.0
#define SphereScale 300

const GLfloat kColorConversion709[] = {
    1.164,  1.164, 1.164,
    0.0, -0.213, 2.112,
    1.793, -0.533,   0.0,
};

// Uniform index.
enum {
    UNIFORM_MODELVIEWPROJECTION_MATRIX,
    UNIFORM_Y,
    UNIFORM_UV,
    UNIFORM_COLOR_CONVERSION_MATRIX,
    NUM_UNIFORMS
};
GLint uniforms[NUM_UNIFORMS];

#endif /* Header_h */
