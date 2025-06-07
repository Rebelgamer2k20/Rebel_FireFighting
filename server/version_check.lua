-- Simple GitHub Release Version Checker for FiveM Resources

local resourceName = GetCurrentResourceName()
local currentVersion = _G.REBEL_MECHANIC_VERSION or "0.0.0.0"

-- Set your GitHub username and repository name here
local githubUser = "RebelGamer2k20"
local githubRepo = "Rebel_Mechanic"

-- Helper: Parse version string (e.g., "v1.2.3" or "1.2.3")
local function parseVersion(str)
    if not str then return nil end
    local major, minor, patch = str:match("v?(%d+)%.(%d+)%.(%d+)")
    if major and minor and patch then
        return tonumber(major), tonumber(minor), tonumber(patch)
    end
    return nil
end

-- Helper: Compare two versions, returns true if v2 > v1
local function isNewerVersion(v1, v2)
    local a1, b1, c1 = parseVersion(v1)
    local a2, b2, c2 = parseVersion(v2)
    if not (a1 and b1 and c1 and a2 and b2 and c2) then return false end
    if a2 > a1 then return true end
    if a2 == a1 and b2 > b1 then return true end
    if a2 == a1 and b2 == b1 and c2 > c1 then return true end
    return false
end

-- Main version check
local function checkVersion()
    if not currentVersion then
        print(("^1[Version Check]^0 Could not determine current version for resource '%s'.^0"):format(resourceName))
        return
    end

    PerformHttpRequest(
        ("https://api.github.com/repos/%s/%s/releases/latest"):format(githubUser, githubRepo),
        function(status, response)
            if status ~= 200 or not response then
                print("^1[Version Check]^0 Could not fetch latest version info from GitHub.^0")
                return
            end

            local data = json.decode(response)
            if not data or not data.tag_name then
                print("^1[Version Check]^0 Invalid response from GitHub API.^0")
                return
            end

            local latestVersion = data.tag_name
            if isNewerVersion(currentVersion, latestVersion) then
                print(("^3[Version Check]^0 Update available! Current version: %s, Latest version: %s."):format(currentVersion, latestVersion))
                print("^7Visit the FiveM portal to download the latest version.")
            else
                print(("^2[Version Check]^0 Resource '%s' is up to date."):format(resourceName))
            end
        end,
        "GET"
    )
end

checkVersion()