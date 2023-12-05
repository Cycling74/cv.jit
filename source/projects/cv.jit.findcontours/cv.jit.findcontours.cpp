/*

COPYRIGHTS AND LICENSE

*/

#include <opencv2/core/core.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <math.h>
#include <iostream>

#include "c74_jitter.h"

#include "cvjit.h"
#include "jitOpenCV.h"

using namespace cv;
using namespace std;
using namespace c74::max;

typedef struct _cv_jit_rj_findcontours {
    t_object ob;

    float   level;      // ? what is this ?
    float   epsilon;    // contours approximation

} t_cv_jit_rj_findcontours;

void *_cv_jit_rj_findcontours_class;

t_jit_err cv_jit_rj_findcontours_init(void);
t_cv_jit_rj_findcontours *cv_jit_rj_findcontours_new(void);
void cv_jit_rj_findcontours_free(t_cv_jit_rj_findcontours *x);
t_jit_err cv_jit_rj_findcontours_matrix_calc(t_cv_jit_rj_findcontours *x, void *inputs, void *outputs);

t_jit_err cv_jit_rj_findcontours_init(void)
{
    t_jit_object *mop;

    _cv_jit_rj_findcontours_class = jit_class_new("cv_jit_findcontours",(method)cv_jit_rj_findcontours_new,(method)cv_jit_rj_findcontours_free,sizeof(t_cv_jit_rj_findcontours),0L);

    // add mop
    mop = (t_jit_object*)jit_object_new(_jit_sym_jit_mop,1,1); // args are  num inputs and num outputs
    jit_class_addadornment(_cv_jit_rj_findcontours_class,mop);

    // add methods
    jit_class_addmethod(_cv_jit_rj_findcontours_class, (method)cv_jit_rj_findcontours_matrix_calc, "matrix_calc", A_CANT, 0L);

    // add attributes
    cvjit::AttributeManager attributes(_cv_jit_rj_findcontours_class);

    attributes.add<float>("level", -2.f, CVJIT_CALCOFFSET(&t_cv_jit_rj_findcontours::level));
    attributes.add<float>("epsilon", 0.f, CVJIT_CALCOFFSET(&t_cv_jit_rj_findcontours::epsilon));

    jit_class_register(_cv_jit_rj_findcontours_class);

    return JIT_ERR_NONE;
}


t_jit_err cv_jit_rj_findcontours_matrix_calc(t_cv_jit_rj_findcontours *x, void *inputs, void *outputs)
{
    t_object * in_matrix = (t_object *)jit_object_method(inputs, _jit_sym_getindex, 0);
    t_object * out_matrix = (t_object *)jit_object_method(outputs, _jit_sym_getindex, 0);

    t_jit_matrix_info    out_minfo;
    float*               out_bp;
    t_jit_matrix_info    in_minfo;
    char*                in_bp;
    //void*                out2_matrix;
    //out2_matrix = jit_object_method(outputs, _jit_sym_getindex, 0);

    if (x && in_matrix && out_matrix) {

        cvjit::Savelock savelocks[] = {in_matrix, out_matrix};

        cvjit::JitterMatrix src(in_matrix);
        cvjit::JitterMatrix dst(out_matrix);

        jit_object_method(out_matrix, _jit_sym_getinfo, &out_minfo);
        jit_object_method(out_matrix, _jit_sym_getdata, &out_bp);

        jit_object_method(in_matrix, _jit_sym_getinfo, &in_minfo);
        jit_object_method(in_matrix, _jit_sym_getdata, &in_bp);

        // long matrices are not supported, and input must have 2 dimensions.
        t_jit_err err = cvjit::Validate(x, src)
            .dimcount(2)
            .type(_jit_sym_char, _jit_sym_float32, _jit_sym_float64, _jit_sym_long);

        if (JIT_ERR_NONE == err) {

            // Calculate
            try {

                vector<vector<Point> > contours;
                vector<Vec4i> hierarchy;

                cv::Mat src_mat = src;

                vector<vector<Point> > contours0;
                findContours(src_mat, contours0, hierarchy, RETR_TREE, CHAIN_APPROX_SIMPLE);
                contours.resize(contours0.size());

                // SIMPLIFY CONTOURS
                for (size_t k = 0; k < contours0.size(); k++)
                    approxPolyDP(Mat(contours0[k]), contours[k], x->epsilon, true);

                //dst.clear();

                //cv::Mat dst_mat = dst;

                //drawContours(dst_mat, contours, x->level, Scalar(255), 1, LINE_AA, hierarchy, std::abs(x->level));

                // END FIRST MATRIX OUT

                int total = 0;
                int i;
                for (i = 0; i < contours.size(); i++) {
                    total = total + contours[i].size();
                }

                float* array = new float[total * 3];
                int ind = 0;
                int j;
                for (i = 0; i < contours.size(); i++) {
                    for (j = 0; j < contours[i].size(); j++) {
                        array[ind] = contours[i][j].x;
                        array[ind + 1] = contours[i][j].y;
                        array[ind + 2] = i;
                        ind = ind + 3;
                    }
                }

                // set output matrix informations
                out_minfo.dim[1] = 1;
                out_minfo.dim[0] = total;
                out_minfo.type = _jit_sym_float32;
                out_minfo.planecount = 3;
                out_minfo.flags = JIT_MATRIX_DATA_REFERENCE | JIT_MATRIX_DATA_PACK_TIGHT;
                out_minfo.size = out_minfo.dim[0] * out_minfo.planecount * sizeof(float);

                jit_object_method(out_matrix, _jit_sym_setinfo_ex, &out_minfo);
                jit_object_method(out_matrix, _jit_sym_data, array);
                jit_object_method(out_matrix, _jit_sym_getdata, &out_bp);
            }
            catch (cv::Exception &exception) {
                in_bp[0] = 99;

                c74::max::object_post(in_matrix, "in_minfo.dim %d", in_minfo.dim);
                c74::max::object_post(in_matrix, "in_minfo.planecount %d", in_minfo.planecount);
                c74::max::object_post(in_matrix, "in_minfo.type %d", in_minfo.type);
                for (int i = 0; i < 32; i++) {
                    c74::max::object_post(in_matrix, "in_minfo.dimstride %d %d", i, in_minfo.dimstride[i]);
                }
                jit_object_method(out_matrix, _jit_sym_setinfo_ex, &in_minfo);
                jit_object_method(out_matrix, _jit_sym_data, in_bp);

                object_error((t_object *)x, "OpenCV error: %s", exception.what());
            }
        }

        return err;

    } else {
        return JIT_ERR_INVALID_PTR;
    }
}

t_cv_jit_rj_findcontours *cv_jit_rj_findcontours_new(void)
{
    t_cv_jit_rj_findcontours *x;

    if ((x=(t_cv_jit_rj_findcontours *)jit_object_alloc(_cv_jit_rj_findcontours_class)))
    {
        x->level = -2.f;
        x->epsilon = 0.f;
    }
    else
    {
        x = NULL;
    }
    return x;
}

void cv_jit_rj_findcontours_free(t_cv_jit_rj_findcontours *x)
{
    // Nothing
}
