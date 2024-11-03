import os
import logging
from logging.handlers import RotatingFileHandler


class Logger:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(Logger, cls).__new__(cls)
            cls._instance.logger = logging.getLogger("Logger")
            cls._instance.logger.setLevel(logging.INFO)

            os.makedirs("logs", exist_ok=True)
            os.chmod("logs", 0o755)

            # Clear the log file by opening it in write mode
            log_file_path = os.path.join("logs", "tcp.log")
            with open(log_file_path, 'w'):
                os.chmod(log_file_path, 0o644)
                pass

            if not cls._instance.logger.hasHandlers():
                file_handler = RotatingFileHandler(
                    log_file_path, maxBytes=10 ** 8, backupCount=5, encoding="utf-8")
                file_handler.setLevel(logging.INFO)

                formatter = logging.Formatter(
                    "%(asctime)s - %(levelname)s - %(message)s")
                file_handler.setFormatter(formatter)

                cls._instance.logger.addHandler(file_handler)

        return cls._instance

    def log_info(self, message: str, print_console: bool = False):
        self.logger.info(message)
        if print_console:
            print(message)

    def log_warning(self, message: str):
        self.logger.warning(message)
        print(message)

    def log_error(self, message: str):
        self.logger.error(message)
        print(message)


logger = Logger()
