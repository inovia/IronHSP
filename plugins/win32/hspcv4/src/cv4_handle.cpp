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
