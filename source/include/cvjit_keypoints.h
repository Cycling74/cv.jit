#ifndef CVJIT_KEYPOINTS_H
#define CVJIT_KEYPOINTS_H

#include "c74_jitter.h"

namespace cvjit {
    
    enum KeypointMethod {
        AKAZE = 0,
        BRISK,
        KAZE,
        ORB,
        KEYPOINT_METHOD_COUNT
    };

    static c74::max::t_symbol * keypoint_methods[KEYPOINT_METHOD_COUNT] = {
        gensym("AKAZE"),
        gensym("BRISK"),
        gensym("KAZE"),
        gensym("ORB")
    };

    enum KeypointField {
        KEYPOINT_X = 0,
        KEYPOINT_Y,
        KEYPOINT_SIZE,
        KEYPOINT_ANGLE,
        KEYPOINT_RESPONSE,
        KEYPOINT_OCTAVE,
        KEYPOINT_FIELD_COUNT
    };
}

#endif