
#include "appengine.h"
#include "hsp3/ndk/hgiox.h"
#include "hsp3embed/hsp3embed.h"

#include <android/sensor.h>
#include <android_native_app_glue.h>


/**
 * �f�o�C�X�ɑ΂��Ă�EGL�R���e�L�X�g�̏�����
 */
static int engine_init_display(struct engine* engine) {
    // OepGL ES �� EGL�̏�����

    const EGLint attribs[] =
            { EGL_SURFACE_TYPE, EGL_WINDOW_BIT, EGL_BLUE_SIZE, 8,
                    EGL_GREEN_SIZE, 8, EGL_RED_SIZE, 8, EGL_NONE };
    EGLint w, h, dummy, format;
    EGLint numConfigs;
    EGLConfig config;
    EGLSurface surface;
    EGLContext context;

    EGLDisplay display = eglGetDisplay(EGL_DEFAULT_DISPLAY);

    eglInitialize(display, 0, 0);

    eglChooseConfig(display, attribs, &config, 1, &numConfigs);

    eglGetConfigAttrib(display, config, EGL_NATIVE_VISUAL_ID, &format);

    ANativeWindow_setBuffersGeometry(engine->app->window, 0, 0, format);

    surface = eglCreateWindowSurface(display, config, engine->app->window,
            NULL);
    context = eglCreateContext(display, config, NULL, NULL);

    if (eglMakeCurrent(display, surface, surface, context) == EGL_FALSE) {
        LOGW("Unable to eglMakeCurrent");
        return -1;
    }

    eglQuerySurface(display, surface, EGL_WIDTH, &w);
    eglQuerySurface(display, surface, EGL_HEIGHT, &h);

    engine->display = display;
    engine->context = context;
    engine->surface = surface;
    engine->width = w;
    engine->height = h;

    // �{�b�N�X�\���̏�����
    //initBox(engine);
    hgio_init( 0, engine->width, engine->height, engine );
    //hgio_clsmode( 1, 0x000000, 0 );

    return 0;
}

/*
 * ���t���[���`��
 */
static void engine_draw_frame(struct engine* engine) {

/*
    if (engine->display == NULL) {
        // display������
        return;
    }
*/
    //glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    //drawBox();
    hgio_test();
    //eglSwapBuffers(engine->display, engine->surface);
}

/**
 * EGL�R���e�L�X�g��j������
 */
static void engine_term_display(struct engine* engine) {
    hgio_term();
    if (engine->display != EGL_NO_DISPLAY) {
        eglMakeCurrent(engine->display, EGL_NO_SURFACE, EGL_NO_SURFACE,
                EGL_NO_CONTEXT);
        if (engine->context != EGL_NO_CONTEXT) {
            eglDestroyContext(engine->display, engine->context);
        }
        if (engine->surface != EGL_NO_SURFACE) {
            eglDestroySurface(engine->display, engine->surface);
        }
        eglTerminate(engine->display);
    }
    engine->animating = 0;
    engine->display = EGL_NO_DISPLAY;
    engine->context = EGL_NO_CONTEXT;
    engine->surface = EGL_NO_SURFACE;
}

/**
 * ���̓C�x���g����������
 */
static int32_t engine_handle_input(struct android_app* app,
        AInputEvent* event) {
    struct engine* engine = (struct engine*) app->userData;
    if (AInputEvent_getType(event) == AINPUT_EVENT_TYPE_MOTION) {

		int xx,yy;
		xx = AMotionEvent_getX(event, 0);
		yy = AMotionEvent_getY(event, 0);
        engine->state.x = xx;
        engine->state.y = yy;
        int action = AKeyEvent_getAction(event);
        switch (action & AMOTION_EVENT_ACTION_MASK) {
		case AMOTION_EVENT_ACTION_DOWN:
        	//LOGI("***DOWN(%d,%d)",xx,yy);
			hgio_touch( xx, yy, 1 );
			break;
        case AMOTION_EVENT_ACTION_MOVE:
        	//LOGI("***MOVE(%d,%d)",xx,yy);
			hgio_touch( xx, yy, 1 );
			break;
        case AMOTION_EVENT_ACTION_UP:
        	//LOGI("***UP");
			hgio_touch( xx, yy, 0 );
			break;
		}
//		engine->animating = 1;
        return 1;
    }
    return 0;
}

/**
 * ���C���R�}���h�̏���
 */
static void engine_handle_cmd(struct android_app* app, int32_t cmd) {
    struct engine* engine = (struct engine*) app->userData;
    switch (cmd) {
    case APP_CMD_SAVE_STATE:
        engine->app->savedState = malloc(sizeof(struct saved_state));
        *((struct saved_state*) engine->app->savedState) = engine->state;
        engine->app->savedStateSize = sizeof(struct saved_state);
        break;
    case APP_CMD_INIT_WINDOW:
        if (engine->app->window != NULL) {
            engine_init_display(engine);
            //engine_draw_frame(engine);
			hsp3eb_init();
	        engine->animating = 1;
        }
        break;
    case APP_CMD_TERM_WINDOW:
        engine_term_display(engine);
        break;
    case APP_CMD_GAINED_FOCUS:
        engine->animating = 1;
/*
        if (engine->accelerometerSensor != NULL) {
            ASensorEventQueue_enableSensor(engine->sensorEventQueue,
                    engine->accelerometerSensor);
            ASensorEventQueue_setEventRate(engine->sensorEventQueue,
                    engine->accelerometerSensor, (1000L / 60) * 1000);
        }
        engine_draw_frame(engine);
*/
        break;
    case APP_CMD_LOST_FOCUS:
/*
        if (engine->accelerometerSensor != NULL) {
            ASensorEventQueue_disableSensor(engine->sensorEventQueue,
                    engine->accelerometerSensor);
        }
*/
        engine->animating = 0;
        break;
    }
}

/**
 * �A�v���P�[�V�����J�n
 */
void android_main(struct android_app* state) {
    struct engine engine;

    // glue���폜����Ȃ��悤��
    app_dummy();

    memset(&engine, 0, sizeof(engine));
    state->userData = &engine;
    state->onAppCmd = engine_handle_cmd;
    state->onInputEvent = engine_handle_input;
    engine.app = state;

    // �Z���T�[����̃f�[�^�擾�ɕK�v�ȏ�����
/*
    engine.sensorManager = ASensorManager_getInstance();
    engine.accelerometerSensor = ASensorManager_getDefaultSensor(
            engine.sensorManager, ASENSOR_TYPE_ACCELEROMETER);
    engine.sensorEventQueue = ASensorManager_createEventQueue(
            engine.sensorManager, state->looper, LOOPER_ID_USER, NULL,
            NULL);
*/
    if (state->savedState != NULL) {
        // �ȑO�̏�Ԃɖ߂�
        engine.state = *(struct saved_state*) state->savedState;
    }
    while (1) {

        int ident;
        int events;
        struct android_poll_source* source;

        // �A�v���P�[�V���������삷�邱�ƂɂȂ�΁A�����Z���T�[�̐�����s��
        while ((ident = ALooper_pollAll(engine.animating ? 0 : -1, NULL,
                &events, (void**) &source)) >= 0) {

            // �C�x���g����������
            if (source != NULL) {
                source->process(state, source);
            }

            // �Z���T�[�ɉ�������̃f�[�^�����݂����珈������
/*
            if (ident == LOOPER_ID_USER) {
                if (engine.accelerometerSensor != NULL) {
                    ASensorEvent event;
                    while (ASensorEventQueue_getEvents(
                            engine.sensorEventQueue, &event, 1) > 0) {
                        LOGI("accelerometer: x=%f y=%f z=%f",
                                event.acceleration.x, event.acceleration.y,
                                event.acceleration.z);
                    }
                }
            }
*/

            // �j���v������������
            if (state->destroyRequested != 0) {
				break;
            }
        }

        if (engine.animating) {
            // ��ʕ`��

			hsp3eb_exec();
			//engine_draw_frame(&engine);
        }
    }

    // �j��
	hsp3eb_bye();
	engine_term_display(&engine);
	return;
}



