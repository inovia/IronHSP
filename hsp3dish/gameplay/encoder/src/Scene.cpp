#include "Base.h"
#include "Scene.h"

namespace gameplay
{

Scene::Scene(void) : _cameraNode(NULL)
{
    _ambientColor[0] = 0.0f;
    _ambientColor[1] = 0.0f;
    _ambientColor[2] = 0.0f;
    setId("scene");
}

Scene::~Scene(void)
{
}

unsigned int Scene::getTypeId(void) const
{
    return SCENE_ID;
}

const char* Scene::getElementName(void) const
{
    return "Scene";
}

void Scene::writeBinary(FILE* file)
{
    Object::writeBinary(file);
    writeBinaryObjects(_nodes, file);
    if (_cameraNode)
    {
        _cameraNode->writeBinaryXref(file);
    }
    else
    {
        writeZero(file);
    }
    write(_ambientColor, Light::COLOR_SIZE, file);
}

void Scene::writeText(FILE* file)
{
    fprintElementStart(file);
    for (std::list<Node*>::const_iterator i = _nodes.begin(); i != _nodes.end(); ++i)
    {
        (*i)->writeText(file);
    }
    if (_cameraNode)
    {
        fprintfElement(file, "activeCamera", _cameraNode->getId());
    }
    fprintfElement(file, "ambientColor", _ambientColor, Light::COLOR_SIZE);
    fprintElementEnd(file);
}

void Scene::add(Node* node)
{
    _nodes.push_back(node);
}

void Scene::setActiveCameraNode(Node* node)
{
    _cameraNode = node;
}

Node* Scene::getFirstCameraNode() const
{
    for (std::list<Node*>::const_iterator i = _nodes.begin(); i != _nodes.end(); ++i)
    {
        Node* n = (*i)->getFirstCameraNode();
        if (n)
        {
            return n;
        }
    }
    return NULL;
}

void Scene::calcAmbientColor()
{
    float values[3] = {0.0f, 0.0f, 0.0f};
    for (std::list<Node*>::const_iterator i = _nodes.begin(); i != _nodes.end(); ++i)
    {
        calcAmbientColor(*i, values);
    }
    
    _ambientColor[0] = std::min(values[0], 1.0f);
    _ambientColor[1] = std::min(values[1], 1.0f);
    _ambientColor[2] = std::min(values[2], 1.0f);
}

void Scene::setAmbientColor(float red, float green, float blue)
{
    _ambientColor[0] = red;
    _ambientColor[1] = green;
    _ambientColor[2] = blue;
}

void Scene::calcAmbientColor(const Node* node, float* values) const
{
    if (!node)
    {
        return;
    }
    if (node->hasLight())
    {
        Light* light = node->getLight();
        if (light->isAmbient())
        {
            values[0] += light->getRed();
            values[1] += light->getGreen();
            values[2] += light->getBlue();
        }
    }
    for (Node* child = node->getFirstChild(); child != NULL; child = child->getNextSibling())
    {
        calcAmbientColor(child, values);
    }
}

void Scene::processSceneMeshSub( Node *cnode, int nodeid, int pass )
{
	for (Node* node = cnode->getFirstChild(); node != NULL; node = node->getNextSibling())
	{
		processSceneMeshSub(node,nodeid,pass);
	}

	if ( cnode->isJoint() ) {
		_search_joint[0]++;
	}

	if ( pass == 1 ) {
		if (_search_joint[nodeid]) {
			const char *name = cnode->getId().c_str();
			Model *model = cnode->getModel();

			if ( model ) {
				printf( "N%d:%s\n",nodeid,name );
			}
		}
	}

}


int Scene::processSceneMesh(int pass)
{
	//	�V�[�����̃��b�V���m�[�h����͂��đg�݊������s��
	//		joint�m�[�h��mesh�m�[�h�ɕ�����
	//		joint�m�[�h�ɂ���mesh��scene���[�g�Ɉړ�����
	//		pass:0  joint�m�[�h����͂���
	//		pass:1  joint�m�[�h����mesh���ړ�����
	//
	if (pass==0) {
		_search_joint.clear();
		_search_meshNode = NULL;
		_search_result = 0;
	}
	int nodeid = 0;
    for (std::list<Node*>::const_iterator i = _nodes.begin(); i != _nodes.end(); ++i)
    {
        Node *cnode = *i;
		if (pass==0) {
			_search_joint.push_back(0);
		}
		processSceneMeshSub(cnode,nodeid,pass);
		if (pass==0) {
			const char *name = cnode->getId().c_str();
			printf( "N%d:%d(%s)\n",nodeid,_search_joint[nodeid],name );
			if (_search_joint[nodeid]==0) {
				_search_meshNode = cnode;				// joint�m�[�h�ł͂Ȃ�=mesh�m�[�h�Ƃ���
			}
		}
		nodeid++;
    }
	return 0;
}


}
