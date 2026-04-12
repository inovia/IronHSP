//
//  hspcv4 : Mat handle manager
//
//  Maps int IDs to cv::Mat instances (owned). Handles are leased
//  from a monotonically growing counter but reuses freed slots by
//  searching the map. IDs are >= 0, -1 means invalid.
//
#include "hspcv4.h"
#include <unordered_map>
#include <memory>
#include <mutex>
#include <string>

namespace hspcv4 {

namespace {

std::unordered_map<int, std::unique_ptr<cv::Mat>> g_handles;
std::unordered_map<int, std::unique_ptr<cv::CascadeClassifier>> g_cascades;
std::unordered_map<int, std::unique_ptr<cv::VideoCapture>> g_captures;
std::unordered_map<int, std::unique_ptr<cv::VideoWriter>> g_writers;
std::unordered_map<int, std::unique_ptr<cv::dnn::Net>> g_nets;
std::mutex g_mutex;
int g_next_id = 0;
std::string g_last_error;

} // anonymous namespace


int handle_alloc(cv::Mat&& mat)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    int id = g_next_id++;
    g_handles[id] = std::make_unique<cv::Mat>(std::move(mat));
    return id;
}

cv::Mat* handle_get(int id)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    auto it = g_handles.find(id);
    if (it == g_handles.end()) return nullptr;
    return it->second.get();
}

bool handle_set(int id, cv::Mat&& mat)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_handles[id] = std::make_unique<cv::Mat>(std::move(mat));
    if (id >= g_next_id) g_next_id = id + 1;
    return true;
}

void handle_free(int id)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_handles.erase(id);
}

void handle_clear_all()
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_handles.clear();
    g_next_id = 0;
}

bool cascade_set(int id, cv::CascadeClassifier&& cc)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_cascades[id] = std::make_unique<cv::CascadeClassifier>(std::move(cc));
    return true;
}

cv::CascadeClassifier* cascade_get(int id)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    auto it = g_cascades.find(id);
    if (it == g_cascades.end()) return nullptr;
    return it->second.get();
}

void cascade_free(int id)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_cascades.erase(id);
}

void cascade_clear_all()
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_cascades.clear();
}

bool capture_set(int id, cv::VideoCapture&& vc)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_captures[id] = std::make_unique<cv::VideoCapture>(std::move(vc));
    return true;
}

cv::VideoCapture* capture_get(int id)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    auto it = g_captures.find(id);
    if (it == g_captures.end()) return nullptr;
    return it->second.get();
}

void capture_free(int id)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_captures.erase(id);
}

void capture_clear_all()
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_captures.clear();
}

bool writer_set(int id, cv::VideoWriter&& vw)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_writers[id] = std::make_unique<cv::VideoWriter>(std::move(vw));
    return true;
}

cv::VideoWriter* writer_get(int id)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    auto it = g_writers.find(id);
    if (it == g_writers.end()) return nullptr;
    return it->second.get();
}

void writer_free(int id)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_writers.erase(id);
}

void writer_clear_all()
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_writers.clear();
}

bool dnn_set(int id, cv::dnn::Net&& net)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_nets[id] = std::make_unique<cv::dnn::Net>(std::move(net));
    return true;
}

cv::dnn::Net* dnn_get(int id)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    auto it = g_nets.find(id);
    if (it == g_nets.end()) return nullptr;
    return it->second.get();
}

void dnn_free(int id)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_nets.erase(id);
}

void dnn_clear_all()
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_nets.clear();
}

void set_last_error(const char* msg)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_last_error = msg ? msg : "";
}

const char* get_last_error()
{
    std::lock_guard<std::mutex> lock(g_mutex);
    return g_last_error.c_str();
}

} // namespace hspcv4
