# # # Main application structure for Mac app (compatible with M1 Silicon)

# # # This file should be saved as "main.py"

# # # Additional files and functionality needed:
# # # 1. requirements.txt - List of required packages
# # # 2. README.md - Instructions for setup and usage
# # # 3. icon.ico - Application icon file (optional)

# # # Ensure you have the following packages installed:
# # # PyQt6, sounddevice, numpy, whisper, ollama, pyperclip, keyboard

# # import sys
# # import sounddevice as sd
# # import numpy as np
# # import wave
# # import whisper
# # import ollama
# # import pyperclip
# # import keyboard
# # import os
# # import json
# # from datetime import datetime
# # from PyQt6.QtWidgets import QApplication, QMainWindow, QWidget, QVBoxLayout, QPushButton, QTextEdit, QComboBox, QListWidget
# # from PyQt6.QtCore import Qt, QThread, pyqtSignal
# # from PyQt6.QtGui import QIcon, QFont

# # class RecordingThread(QThread):
# #     finished = pyqtSignal(str)

# #     def __init__(self, duration, samplerate=44100):
# #         super().__init__()
# #         self.duration = duration
# #         self.samplerate = samplerate

# #     def run(self):
# #         recording = sd.rec(int(self.duration * self.samplerate), samplerate=self.samplerate, channels=1)
# #         sd.wait()
# #         timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
# #         filename = f"audio_{timestamp}.wav"
# #         with wave.open(filename, 'wb') as wf:
# #             wf.setnchannels(1)
# #             wf.setsampwidth(2)
# #             wf.setframerate(self.samplerate)
# #             wf.writeframes(recording.tobytes())
# #         self.finished.emit(filename)

# # class TranscriptionThread(QThread):
# #     transcription_done = pyqtSignal(str)

# #     def __init__(self, audio_file):
# #         super().__init__()
# #         self.audio_file = audio_file

# #     def run(self):
# #         model = whisper.load_model("base")
# #         result = model.transcribe(self.audio_file)
# #         self.transcription_done.emit(result["text"])

# # class OllamaThread(QThread):
# #     ollama_done = pyqtSignal(str)

# #     def __init__(self, prompt, transcription):
# #         super().__init__()
# #         self.prompt = prompt
# #         self.transcription = transcription

# #     def run(self):
# #         response = ollama.generate(model="llama2", prompt=f"{self.prompt}\n\n{self.transcription}")
# #         self.ollama_done.emit(response)

# # class MainWindow(QMainWindow):
# #     def __init__(self):
# #         super().__init__()
# #         self.setWindowTitle("Transcribe and Format")
# #         self.setGeometry(100, 100, 800, 600)
# #         self.setStyleSheet("background-color: #f0f0f0;")

# #         central_widget = QWidget()
# #         self.setCentralWidget(central_widget)
# #         layout = QVBoxLayout(central_widget)

# #         self.record_button = QPushButton("Record")
# #         self.record_button.setStyleSheet("""
# #             QPushButton {
# #                 background-color: #007AFF;
# #                 color: white;
# #                 border-radius: 5px;
# #                 padding: 10px;
# #                 font-size: 16px;
# #             }
# #             QPushButton:hover {
# #                 background-color: #005AE0;
# #             }
# #         """)
# #         self.record_button.clicked.connect(self.toggle_recording)
# #         layout.addWidget(self.record_button)

# #         self.format_combo = QComboBox()
# #         self.format_combo.addItems(["Email", "Question", "Diary Entry", "Coding Problem"])
# #         self.format_combo.setStyleSheet("""
# #             QComboBox {
# #                 background-color: white;
# #                 border: 1px solid #CCCCCC;
# #                 border-radius: 5px;
# #                 padding: 5px;
# #                 font-size: 14px;
# #             }
# #         """)
# #         layout.addWidget(self.format_combo)

# #         self.transcription_text = QTextEdit()
# #         self.transcription_text.setStyleSheet("""
# #             QTextEdit {
# #                 background-color: white;
# #                 border: 1px solid #CCCCCC;
# #                 border-radius: 5px;
# #                 padding: 10px;
# #                 font-size: 14px;
# #             }
# #         """)
# #         layout.addWidget(self.transcription_text)

# #         self.formatted_text = QTextEdit()
# #         self.formatted_text.setStyleSheet("""
# #             QTextEdit {
# #                 background-color: white;
# #                 border: 1px solid #CCCCCC;
# #                 border-radius: 5px;
# #                 padding: 10px;
# #                 font-size: 14px;
# #             }
# #         """)
# #         layout.addWidget(self.formatted_text)

# #         self.history_list = QListWidget()
# #         self.history_list.setStyleSheet("""
# #             QListWidget {
# #                 background-color: white;
# #                 border: 1px solid #CCCCCC;
# #                 border-radius: 5px;
# #                 padding: 5px;
# #                 font-size: 14px;
# #             }
# #         """)
# #         self.history_list.itemClicked.connect(self.load_history_item)
# #         layout.addWidget(self.history_list)

# #         self.is_recording = False
# #         self.audio_filename = None

# #         self.load_history()

# #     def toggle_recording(self):
# #         if not self.is_recording:
# #             self.start_recording()
# #         else:
# #             self.stop_recording()

# #     def start_recording(self):
# #         self.is_recording = True
# #         self.record_button.setText("Stop Recording")
# #         self.recording_thread = RecordingThread(duration=5)  # 5 seconds recording
# #         self.recording_thread.finished.connect(self.handle_recording_finished)
# #         self.recording_thread.start()

# #     def stop_recording(self):
# #         self.is_recording = False
# #         self.record_button.setText("Record")
# #         # The recording will stop automatically after the specified duration

# #     def handle_recording_finished(self, audio_filename):
# #         self.audio_filename = audio_filename
# #         self.transcription_thread = TranscriptionThread(audio_filename)
# #         self.transcription_thread.transcription_done.connect(self.handle_transcription)
# #         self.transcription_thread.start()

# #     def handle_transcription(self, text):
# #         self.transcription_text.setText(text)
# #         selected_format = self.format_combo.currentText()
        
# #         if selected_format == "Email":
# #             formatted_text = self.format_as_email(text)
# #         elif selected_format == "Question":
# #             formatted_text = self.format_as_question(text)
# #         elif selected_format == "Diary Entry":
# #             formatted_text = self.format_as_diary_entry(text)
# #         elif selected_format == "Coding Problem":
# #             formatted_text = self.format_as_coding_problem(text)
# #         else:
# #             formatted_text = text  # Default case, no formatting
        
# #         self.formatted_text.setText(formatted_text)

# #         self.save_history(self.audio_filename, text, formatted_text)

# #     def format_as_email(self, text):
# #         # Implement email formatting logic here
# #         return f"Subject: [Auto-generated]\n\nDear [Recipient],\n\n{text}\n\nBest regards,\n[Your Name]"

# #     def format_as_question(self, text):
# #         # Implement question formatting logic here
# #         return f"Question: {text}\n\nAnswer: [To be filled]"

# #     def format_as_diary_entry(self, text):
# #         # Implement diary entry formatting logic here
# #         return f"Date: {datetime.now().strftime('%Y-%m-%d')}\n\nDear Diary,\n\n{text}\n\nYours truly,\n[Your Name]"

# #     def format_as_coding_problem(self, text):
# #         # Implement coding problem formatting logic here
# #         return f"Problem Statement:\n{text}\n\nSolution:\n# Your code here"

# #     def save_history(self, audio_filename, transcript, formatted_text):
# #         history_item = {
# #             "timestamp": datetime.now().isoformat(),
# #             "audio_file": audio_filename,
# #             "transcript": transcript,
# #             "formatted_text": formatted_text,
# #             "format_type": self.format_combo.currentText()
# #         }

# #         history_file = "history.json"
# #         if os.path.exists(history_file):
# #             with open(history_file, "r") as f:
# #                 history = json.load(f)
# #         else:
# #             history = []

# #         history.append(history_item)

# #         with open(history_file, "w") as f:
# #             json.dump(history, f, indent=2)

# #         self.load_history()

# #     def load_history(self):
# #         self.history_list.clear()
# #         if os.path.exists("history.json"):
# #             with open("history.json", "r") as f:
# #                 history = json.load(f)
# #             for item in reversed(history):
# #                 self.history_list.addItem(f"{item['timestamp']} - {item['format_type']}")

# #     def load_history_item(self, item):
# #         index = self.history_list.row(item)
# #         with open("history.json", "r") as f:
# #             history = json.load(f)
# #         history_item = history[-(index + 1)]
# #         self.transcription_text.setText(history_item["transcript"])
# #         self.formatted_text.setText(history_item["formatted_text"])
# #         self.format_combo.setCurrentText(history_item["format_type"])

# # if __name__ == "__main__":
# #     app = QApplication(sys.argv)
# #     window = MainWindow()
# #     window.show()
# #     sys.exit(app.exec())



# import sys
# import sounddevice as sd
# import numpy as np
# import wave
# import whisper
# import pyperclip
# import keyboard
# from datetime import datetime
# from PyQt6.QtWidgets import QApplication, QMainWindow, QWidget, QVBoxLayout, QPushButton, QTextEdit, QComboBox, QListWidget
# from PyQt6.QtCore import Qt, QThread, pyqtSignal

# class RecordingThread(QThread):
#     finished = pyqtSignal(str)

#     def __init__(self, duration, samplerate=44100):
#         super().__init__()
#         self.duration = duration
#         self.samplerate = samplerate

#     def run(self):
#         recording = sd.rec(int(self.duration * self.samplerate), samplerate=self.samplerate, channels=1, dtype='float32')
#         sd.wait()
#         timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
#         filename = f"audio_{timestamp}.wav"
#         with wave.open(filename, 'wb') as wf:
#             wf.setnchannels(1)
#             wf.setsampwidth(2)
#             wf.setframerate(self.samplerate)
#             wf.writeframes((recording * 32767).astype(np.int16).tobytes())
#         self.finished.emit(filename)

# class TranscriptionThread(QThread):
#     transcription_done = pyqtSignal(str)

#     def __init__(self, audio_file):
#         super().__init__()
#         self.audio_file = audio_file

#     def run(self):
#         model = whisper.load_model("base")
#         result = model.transcribe(self.audio_file)
#         self.transcription_done.emit(result["text"])

# class MainWindow(QMainWindow):
#     def __init__(self):
#         super().__init__()
#         self.setWindowTitle("Transcribe and Format")
#         self.setGeometry(100, 100, 800, 600)

#         central_widget = QWidget()
#         self.setCentralWidget(central_widget)
#         layout = QVBoxLayout(central_widget)

#         self.record_button = QPushButton("Record")
#         self.record_button.clicked.connect(self.toggle_recording)
#         layout.addWidget(self.record_button)

#         self.transcription_text = QTextEdit()
#         layout.addWidget(self.transcription_text)

#         self.is_recording = False
#         self.recording_thread = None
#         self.transcription_thread = None

#     def toggle_recording(self):
#         if not self.is_recording:
#             self.start_recording()
#         else:
#             self.stop_recording()

#     def start_recording(self):
#         self.is_recording = True
#         self.record_button.setText("Stop Recording")
#         self.recording_thread = RecordingThread(duration=5)  # 5 seconds recording
#         self.recording_thread.finished.connect(self.handle_recording_finished)
#         self.recording_thread.start()

#     def stop_recording(self):
#         self.is_recording = False
#         self.record_button.setText("Record")
#         if self.recording_thread:
#             self.recording_thread.terminate()

#     def handle_recording_finished(self, audio_filename):
#         self.transcription_thread = TranscriptionThread(audio_filename)
#         self.transcription_thread.transcription_done.connect(self.handle_transcription)
#         self.transcription_thread.start()

#     def handle_transcription(self, text):
#         self.transcription_text.setText(text)

# if __name__ == "__main__":
#     app = QApplication(sys.argv)
#     window = MainWindow()
#     window.show()
#     sys.exit(app.exec())


import sys
import sounddevice as sd
import numpy as np
import wave
from datetime import datetime
from PyQt6.QtWidgets import QApplication, QMainWindow, QWidget, QVBoxLayout, QPushButton, QTextEdit

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Audio Recorder")
        self.setGeometry(100, 100, 400, 300)

        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        layout = QVBoxLayout(central_widget)

        self.record_button = QPushButton("Record")
        self.record_button.clicked.connect(self.toggle_recording)
        layout.addWidget(self.record_button)

        self.status_text = QTextEdit()
        self.status_text.setReadOnly(True)
        layout.addWidget(self.status_text)

        self.is_recording = False
        self.audio_data = []

    def toggle_recording(self):
        if not self.is_recording:
            self.start_recording()
        else:
            self.stop_recording()

    def start_recording(self):
        self.is_recording = True
        self.record_button.setText("Stop Recording")
        self.status_text.setText("Recording...")
        self.audio_data = []

        def callback(indata, frames, time, status):
            if status:
                print(status)
            self.audio_data.append(indata.copy())

        self.stream = sd.InputStream(callback=callback, channels=1, samplerate=44100)
        self.stream.start()

    def stop_recording(self):
        if hasattr(self, 'stream'):
            self.stream.stop()
            self.stream.close()
        self.is_recording = False
        self.record_button.setText("Record")
        self.status_text.setText("Recording stopped")

        if self.audio_data:
            self.save_audio()

    def save_audio(self):
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = f"audio_{timestamp}.wav"
        audio_data = np.concatenate(self.audio_data, axis=0)
        with wave.open(filename, 'wb') as wf:
            wf.setnchannels(1)
            wf.setsampwidth(2)
            wf.setframerate(44100)
            wf.writeframes((audio_data * 32767).astype(np.int16).tobytes())
        self.status_text.setText(f"Audio saved as {filename}")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())