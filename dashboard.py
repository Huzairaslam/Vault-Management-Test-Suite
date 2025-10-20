import streamlit as st
import subprocess
import os
import time

st.set_page_config(page_title="Vault Test Dashboard", layout="centered")

st.title("🚀 Vault Management Test Suite")
st.write("Control and monitor your Robot Framework tests from one dashboard.")

# --- Helper functions ---
def run_command(cmd):
    process = subprocess.Popen(
        cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True, text=True
    )
    for line in process.stdout:
        st.write(line.strip())
    process.wait()
    return process.returncode

def activate_venv():
    return "venv\\Scripts\\activate && "

# --- Buttons for test actions ---
st.subheader("🧪 Run Specific Tests")

tests = [
    "FileConfig.robot",
    "Dashboard.robot",
    "ProductTypes.robot",
    "Products.robot",
    "StorageType.robot",
    "Storages.robot",
]

for test_file in tests:
    if st.button(f"▶ Run {test_file}"):
        st.info(f"Running {test_file}...")
        cmd = activate_venv() + f'robot --listener "allure_robotframework;results" {test_file}'
        run_command(cmd)
        st.success(f"{test_file} completed ✅")

if st.button("🔥 Run All Tests"):
    st.info("Running all tests...")
    os.system("rmdir /s /q results") if os.path.exists("results") else None
    os.makedirs("results", exist_ok=True)
    for test in tests:
        st.write(f"➡ Running {test}")
        cmd = activate_venv() + f'robot --listener "allure_robotframework;results" {test}'
        run_command(cmd)
    st.success("All tests completed ✅")

st.divider()

if st.button("📊 View Allure Report"):
    st.info("Launching Allure Report...")
    cmd = activate_venv() + "allure serve results"
    st.write("Serving report... this may open a new browser tab.")
    subprocess.Popen(cmd, shell=True)
    time.sleep(2)
    st.success("Report server started ✅")

st.divider()
st.caption("Built with ❤️ using Streamlit and Robot Framework.")
