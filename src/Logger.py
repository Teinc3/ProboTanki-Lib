import logging
import os
from logging.handlers import RotatingFileHandler


class Logger:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(Logger, cls).__new__(cls)
            os.makedirs("logs", exist_ok=True)
            cls._instance.logger = logging.getLogger("Logger")
            cls._instance.logger.setLevel(logging.INFO)

            if not cls._instance.logger.hasHandlers():
                file_handler = RotatingFileHandler(
                    os.path.join("logs", "tcp.log"), maxBytes=10**7, backupCount=5, encoding="utf-8"  # More than enough
                )
                file_handler.setLevel(logging.INFO)

                formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
                file_handler.setFormatter(formatter)

                cls._instance.logger.addHandler(file_handler)

                # Shows logs in console
                # console_handler = logging.StreamHandler()
                # console_handler.setLevel(logging.INFO)
                # console_handler.setFormatter(formatter)
                # cls._instance.logger.addHandler(console_handler)

        return cls._instance

    def log_info(self, message: str):
        self.logger.info(message)

    def log_warning(self, message: str):
        self.logger.warning(message)

    def log_error(self, message: str):
        self.logger.error(message)
